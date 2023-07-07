class AddAttachmentToLetters < ActiveRecord::Migration[7.0]
  def change
    add_column :letters, :document, :binary
  end
end
