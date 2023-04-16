class Letter < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  has_many :received_letters, class_name: "Letter", foreign_key: "recipient_id"
  has_many :sent_letters, class_name: "Letter", foreign_key: "sender_id"

end
