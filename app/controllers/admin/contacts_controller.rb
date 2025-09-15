class Admin::ContactsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
