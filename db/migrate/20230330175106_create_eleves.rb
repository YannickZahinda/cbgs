class CreateEleves < ActiveRecord::Migration[7.0]
  def change
    create_table :eleves do |t|
      t.string :nom_complet
      t.string :addresse
      t.string :tel_du_parent
      t.string :niveau_etude
      t.string :classe
      t.integer :parent_id

      t.timestamps
    end
  end
end
