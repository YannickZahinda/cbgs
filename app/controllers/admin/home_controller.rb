class Admin::HomeController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def index
    # logic to retrieve data for admin dashboard
  end

  private

  def check_admin
    redirect_to root_path unless current_user.is_admin?
  end
end