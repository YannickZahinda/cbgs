class InstantMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    instant_message = @chatroom.instant_messages.new(message_params)
    instant_message.user = current_user


    instant_message.save
    redirect_to @chatroom
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:instant_message).permit(:body)
  end

end