class CreateInstantMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :instant_messages do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
