class StudentsController < ApplicationController
  def index    
    @students =current_master_account.students
  end

  def show
    @student = Student.find(params[:id])
    @sakura_prints_high_score = @student.sakura_prints.order(total_score: :desc).first
    @current_rank = @student.kente_rank
    @next_rank = @student.next_kente_rank
  end
end
