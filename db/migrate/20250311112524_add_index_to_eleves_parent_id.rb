class AddIndexToElevesParentId < ActiveRecord::Migration[7.0]
  def change
    add_index :eleves, :parent_id
  end
end
