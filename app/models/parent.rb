class Parent < ApplicationRecord
  has_many :eleves, class_name: "Eleve", dependent: :destroy
end
