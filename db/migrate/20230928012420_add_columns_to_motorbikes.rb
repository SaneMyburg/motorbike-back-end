class AddColumnsToMotorbikes < ActiveRecord::Migration[7.0]
  def change
    add_column :motorbikes, :finance_fee, :decimal
    add_column :motorbikes, :total_amount_payable, :decimal
    add_column :motorbikes, :duration, :integer
  end
end
