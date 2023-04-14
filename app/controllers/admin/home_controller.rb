class Admin::HomeController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def index
    @communiques = Communique.all
    @messages = Message.all
    @events = Event.all
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