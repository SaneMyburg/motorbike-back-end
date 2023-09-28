class RemoveUserAssociationFromMotorbikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :motorbikes, name: 'index_motorbikes_on_user_id'
    remove_foreign_key :motorbikes, :users
  end
end
