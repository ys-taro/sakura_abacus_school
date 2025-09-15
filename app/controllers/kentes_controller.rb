class KentesController < ApplicationController
  def show
    @kente_ranks = KenteRank.all
    @student = Student.find(params[:id])
    @kentes = @student.kentes
  end
end
