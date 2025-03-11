class AddUserRefToParents < ActiveRecord::Migration[7.0]
  def change
    add_reference :parents, :user, null: true, foreign_key: true

    reversible do |dir| 
      dir.up do 
        execute <<-SQL
          UPDATE parents
          SET user_id = (SELECT id FROM users ORDER BY created_at LIMIT 1)
          WHERE user_id IS NULL;
        SQL

        change_column_null :parents, :user_id, false
      end
    end
  end
end
