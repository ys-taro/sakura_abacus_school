class Admin::RoomsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @rooms = Room.where(admin_id: current_admin.id)
  end
  def show
    @current_account = current_admin
    @admin = current_admin
    @student = Student.find(params[:id])
  
    @room = Room.find_by(admin: @admin, student: @student)
  
    unless @room
      @room = Room.create!(admin: @admin, student: @student)
    end
  
    @messages = @room.messages.includes(:sender)
  end
end
