class SakuraPrintsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @sakura_prints = @student.sakura_prints
  end
end
