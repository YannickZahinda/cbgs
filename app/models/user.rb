class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sent_letters, class_name: "Letter", foreign_key: "sender_id"
  has_many :received_letters, class_name: "Letter", foreign_key: "recipient_id"
  has_many :user_chats
  has_many :chats, through: :user_chats, source: :chats
  has_many :received_chats, class_name: "Chat", foreign_key: "sender"
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :intant_messages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def self.first_user?
    count == 1
  end


  after_create :set_first_user_as_admin

  private

  def set_first_user_as_admin
    if User.first_user?
      update(is_admin: true)
    end
  end
end
