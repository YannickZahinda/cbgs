class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :nom_complet
      t.string :addresse
      t.string :niveau_etude
      t.string :classe_enseignee
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
