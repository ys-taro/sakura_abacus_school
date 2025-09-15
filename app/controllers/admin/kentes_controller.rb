class Admin::KentesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @kente_numbers = KenteNumber.all
  end

  def show
    @kente_number = KenteNumber.find(params[:id])
    @kente_ranks = KenteRank.all
    @students = @kente_number.students
  end

  def new
    @students = Student.all
    @kente_ranks = KenteRank.all
  end

  def create
    ActiveRecord::Base.transaction do
      kente_number = KenteNumber.find_or_create_by!(number: permitted_params[:kente_number])
      if permitted_params[:students].present?
        permitted_params[:students].each do |student_id, student_data|
          student = Student.find(student_id)
          kente_rank = KenteRank.find_by(id: student_data[:kente_rank_id])
          student_data[:kentes].each do |kente_attr|
            kente = student.kentes.new(kente_attr)
            kente.kente_number_id = kente_number.id
            kente.kente_rank_id = kente_rank.id
            kente.save!
          end
          student_kente_record = student.kentes.find_by(kente_number_id: kente_number.id)
          if student_kente_record.total_score >= kente_rank.passing_score
            student.rank_id = kente_rank.id
            next_rank_id = kente_rank.id + 1
            if KenteRank.exists?(id: next_rank_id)
              student.update!(next_kente_rank_id: next_rank_id)
            else
              student.update!(next_kente_rank_id: nil)
            end
            student.save!
          end
        end
      end
    end
    redirect_to admin_kentes_path, notice: "新規成績を登録しました"
    rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "登録に失敗しました: #{e.record.errors.full_messages.join(', ')}"
    @students = Student.all
    @kente_ranks = KenteRank.all
    render :new
  end

  def edit
    @kente_number = KenteNumber.find(params[:id])
    @kente_ranks = KenteRank.all
    @students = @kente_number.students
  end

  def update
    @kente_number = KenteNumber.find(params[:id])

    ActiveRecord::Base.transaction do
      if params[:students].present?
        params[:students].each do |student_id, student_data|
          student_data[:kentes]&.each do |kente_id, kente_attrs|
            kente = Kente.find(kente_id)

            multiplication_score = kente_attrs[:multiplication_score].to_i
            division_score = kente_attrs[:division_score].to_i
            mitori_score = kente_attrs[:mitori_score].to_i
            total_score = multiplication_score + division_score + mitori_score

            kente.update!(
              multiplication_score: multiplication_score,
              division_score: division_score,
              mitori_score: mitori_score,
              total_score: total_score
            )
          end
        end
      end
    end

    redirect_to admin_kente_path(@kente_number), notice: "成績を更新しました"
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "更新に失敗しました: #{e.record.errors.full_messages.join(', ')}"
    @students = @kente_number.students.includes(:kentes)
    @kente_ranks = KenteRank.all
    render :edit
  end

  def destroy
    @kente_number = KenteNumber.find(params[:id])
  
    ActiveRecord::Base.transaction do
      @kente_number.kentes.destroy_all
      @kente_number.destroy!
    end
  
    redirect_to admin_kentes_path, notice: "検定回と全成績を削除しました"
  rescue StandardError => e
    redirect_to admin_kentes_path, alert: "削除に失敗しました: #{e.message}"
  end
  

  private

  def permitted_params
    params.permit(
      :kente_number,
      students: [
        :kente_rank_id,
        { kentes: [
          :multiplication_score,
          :division_score,
          :mitori_score,
          ]
        }
      ]
    )
  end
end
