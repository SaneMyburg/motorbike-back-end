class RemoveUserIdFromMotorbikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :motorbikes, :user_id, :bigint
  end
end
