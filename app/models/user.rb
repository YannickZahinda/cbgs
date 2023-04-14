class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
