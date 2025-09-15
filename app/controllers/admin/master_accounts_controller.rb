class Admin::MasterAccountsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @master_accounts = MasterAccount.all
  end
  def show
    @master_account = MasterAccount.find(params[:id])
    @students = @master_account.students
  end
end
