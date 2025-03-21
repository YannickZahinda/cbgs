class CreateUserChats < ActiveRecord::Migration[7.0]
  def change
    create_table :user_chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
  end
end
