class AddUserToMotorbikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :motorbikes, :user, null: false, foreign_key: true
  end
end
