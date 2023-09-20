class Chat < ApplicationRecord
 
  belongs_to :sender, class_name: "User"
  has_many :user_chats
  has_many :recipients, through: :user_chats, source: :user, class_name: "User"
  has_many :received_chats, class_name: "Chat", foreign_key: "sender"

end
