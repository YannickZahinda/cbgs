class CreateCommuniques < ActiveRecord::Migration[7.0]
  def change
    create_table :communiques do |t|
      t.string :titre
      t.string :description

      t.timestamps
    end
  end
end
