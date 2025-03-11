class AddParentAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nom_complet, :string
    add_column :users, :addresse, :string
    add_column :users, :phone, :string
  end
end
