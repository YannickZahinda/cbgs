class Parent < ApplicationRecord
  has_many :eleves, class_name: "Eleve", dependent: :destroy
  belongs_to :user
end
