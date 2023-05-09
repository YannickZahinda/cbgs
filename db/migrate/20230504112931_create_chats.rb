class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :sender, foreign_key: {to_table: :users}
      t.text :body

      t.timestamps
    end
  end
end
