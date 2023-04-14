class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :titre
      t.string :message

      t.timestamps
    end
  end
end
