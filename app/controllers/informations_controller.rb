class InformationsController < ApplicationController
  before_action :authenticate_master_account!
  def index
    @informations = Information.order(created_at: :desc).limit(20)
  end

  def show
    @information = Information.find(params[:id])
  end

  private

  def information_params
    params.require(:information).permit(:title, :content, :image)
  end
end
