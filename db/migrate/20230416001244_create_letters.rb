class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string  :nom_du_parent_destinataire
      t.string :subject
      t.text :body
      t.boolean :read

      t.timestamps
    end
  end
end
