class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :nom_complet
      t.string :addresse
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
