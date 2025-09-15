class Admin::InformationsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @informations = Information.order(created_at: :desc).limit(20)
  end

  def show
    @information = Information.find(params[:id])
  end
  
  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to admin_informations_path, notice: "お知らせを投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    information = Information.find(params[:id])
    information.destroy!

    redirect_to admin_informations_path, notice: "お知らせを削除しました"
  rescue StandardError => e
    redirect_to admin_informations_path, alert: "削除に失敗しました: #{e.message}"
  end



  private

  def information_params
    params.require(:information).permit(:title, :content, :image)
  end
end
