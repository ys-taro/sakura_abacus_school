class KentesController < ApplicationController
  before_action :authenticate_master_account!
  
  def show
    @kente_ranks = KenteRank.all
    @student = Student.find(params[:id])
    @kentes = @student.kentes
  end
end
