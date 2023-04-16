class Admin::HomeController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  before_action :require_admin

  def index
    @communiques = Communique.all
    @messages = Message.all
    @events = Event.all
    @letters = Letter.all
  end

  def logged_in_users
    @logged_in_users = User.where("current_sign_in_at IS NOT NULL")
  end

  private

  def require_admin
    unless current_user && current_user.is_admin?
      flash[:error] = "You must be an admin to access this page."
      redirect_to root_path
    end
  end

  # def destroy
    # if @communique.destroy
    #   redirect_to admin_home_index_path, notice: "communique efface avec success"
    # end

    # if @message.destroy
    #   redirect_to admin_home_index_path, notice: "message efface avec success"
    # end

  # end 

  private

  def check_admin
    redirect_to root_path unless current_user.is_admin?
  end
end