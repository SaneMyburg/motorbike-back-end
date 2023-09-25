class CreateMotorbikes < ActiveRecord::Migration[7.0]
  def change
    create_table :motorbikes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photo

      t.timestamps
    end
  end
end
