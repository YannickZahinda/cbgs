class Event < ApplicationRecord
    has_one_attached :image
    has_one_attached :document
end
