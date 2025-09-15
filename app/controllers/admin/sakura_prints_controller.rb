class Admin::SakuraPrintsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @sakura_print_numbers = SakuraPrintNumber.all
  end

  def new
    @students = Student.all
  end

  def show
    @print_number = SakuraPrintNumber.find(params[:id])
    @students = Student.all
  end

  def create
  ActiveRecord::Base.transaction do
    print_number_record = SakuraPrintNumber.find_or_create_by!(number: permitted_params[:print_number])
    permitted_params[:students].each do |student_id, student_data|
      student = Student.find(student_id)
      student_data[:sakura_prints].each do |print_attr|
        sp = student.sakura_prints.new(print_attr)
        sp.sakura_print_number = print_number_record
        sp.save!
      end
    end
  end
  redirect_to admin_sakura_prints_path, notice: "新規成績を登録しました"
  rescue ActiveRecord::RecordInvalid => e
  flash.now[:alert] = "登録に失敗しました: #{e.record.errors.full_messages.join(', ')}"
  @students = Student.all
  render :new
  end

  def edit
    @print_number = SakuraPrintNumber.find(params[:id])
    @students = Student.all
  end

  def update
    print_number = SakuraPrintNumber.find(params[:id])
    ActiveRecord::Base.transaction do
      permitted_params[:students].each do |student_id, student_data|
        student = Student.find(student_id)
        student_data[:sakura_prints].each do |print_id, print_attr|
          sp = student.sakura_prints.find_or_initialize_by(id: print_id, sakura_print_number: print_number)
          sp.assign_attributes(print_attr.permit(:multiplication_score, :division_score, :mitori_score, :mitori_anzan_score))
          sp.save!
        end
      end
    end
  
    redirect_to admin_sakura_prints_path, notice: "成績を更新しました"
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "更新に失敗しました: #{e.record.errors.full_messages.join(', ')}"
    @students = Student.all
    render :edit
  end
  
  

  def destroy
    print_number = SakuraPrintNumber.find(params[:id])
    print_number.destroy!
    redirect_to admin_sakura_prints_path, notice: "さくらプリントNo.#{print_number.number} の成績を削除しました"
  rescue ActiveRecord::RecordNotDestroyed => e
    redirect_to admin_sakura_print_path(print_number), alert: "削除に失敗しました: #{e.message}"
  end
  
  

  private

  def permitted_params
    params.permit(
      :print_number,
      students: {
        sakura_prints: [
          :multiplication_score,
          :division_score,
          :mitori_score,
          :mitori_anzan_score
        ]
      }
    )
  end
end

