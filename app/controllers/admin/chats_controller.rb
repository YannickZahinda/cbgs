class Admin::ChatsController < ApplicationController 

    def index
      @chats = Chat.all
    end
    
    def new 
      @chat = Chat.new
    end

    def create
      @chat = Chat.new(chat_params)
      @chat.sender = current_user
    
      if @chat.save
        # Exclude the current user from the uniqueness check
        # @chat.recipients = User.where.not(id: current_user.id).where(id: @chat.recipient_ids)
        @chat.recipients = User.all
        flash[:success] = "Message envoyé à tous les utilisateurs sélectionnés."
        redirect_to admin_home_index_path
      else
        render :new
      end
    end

    # def create
    #   @chat = Chat.new(chat_params)
    #   @chat.sender = current_user
    #   @chat.recipients = User.all
    #   if @chat.save
    #     flash[:success] = "Message envoyé à tous les utilisateurs."
    #     redirect_to admin_home_index_path
    #   else
    #     render :new
    #   end
    # end

    private
  
    def chat_params
      params.require(:chat).permit(:body, recipient_ids: [])
    end
end