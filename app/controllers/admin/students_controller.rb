class Admin::StudentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    
    @students =Student.all
  end

  def show
    @student = Student.find(params[:id])
    @sakura_prints_high_score = @student.sakura_prints.order(total_score: :desc).first
    @current_rank = @student.kente_rank
    @next_rank = @student.next_kente_rank
  end

  def new
    @master_account = MasterAccount.find(params[:master_account_id])
    @student = @master_account.students.build
    @kente_ranks = KenteRank.all
  end

  def create
    @master_account = MasterAccount.find(params[:master_account_id])
    @student = @master_account.students.build(student_params)
    if @student.save
      redirect_to admin_master_account_path(@master_account), notice: "生徒を作成しました"
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
    @kente_ranks = KenteRank.all
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path(@student), notice: "生徒情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @master_account = @student.master_account
    @student.destroy
    redirect_to admin_master_account_path(@master_account), notice: "生徒を削除しました"
  end
  
  private
  
  def student_params
    if action_name == 'edit' || action_name == 'update'
      params.require(:student).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :rank_id, :is_active, :next_kente_rank_id)
    else
      params.require(:student).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :rank_id, :is_active)
    end
  end
end
