class SakuraPrintsController < ApplicationController
  before_action :authenticate_master_account!

  def show
    @student = Student.find(params[:id])
    @sakura_prints = @student.sakura_prints
  end
end
