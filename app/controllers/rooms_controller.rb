class RoomsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])    
    @admins = Admin.select(:id, :last_name, :first_name)
  end
  def show
    @current_account = current_master_account
    @admin = Admin.select(:id, :first_name, :last_name).find(params[:id])
    @student = Student.find(params[:student_id])
  
    @room = Room.find_by(admin: @admin, student: @student)
  
    unless @room
      @room = Room.create!(admin: @admin, student: @student)
    end
  
    @messages = @room.messages.includes(:sender)
  end
  
end
