class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_logged_in

  def index
    @letters = current_user.received_letters.order(created_at: :desc)  
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def check_logged_in
    redirect_to root_path unless current_user
  end

end
