class Eleve < ApplicationRecord
    belongs_to :parent, class_name: "Parent"
end
