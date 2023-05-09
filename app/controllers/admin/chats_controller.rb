class Admin::ChatsController < ApplicationController 
    
    def new 
      @chat = Chat.new
    end

    def create
        @chat = Chat.new(chat_params)
        @chat.sender = current_user
        if @chat.save
          User.where.not(id: current_user.id).each do |recipient|
            @chat.user_chats.create(user: recipient, chat: @chat)
          end
          flash[:success] = "Message envoyé à tous les utilisateurs."
          redirect_to messages_path
        else
          render :new
        end
      end
    
      private
    
      def chat_params
        params.require(:chat).permit(:body, recipient_ids: [])
      end
end