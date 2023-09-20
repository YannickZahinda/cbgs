class AddAttachmentToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :document, :binary
  end
end
