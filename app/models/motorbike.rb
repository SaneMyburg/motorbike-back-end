class Motorbike < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
  validates :finance_fee, presence: true
  validates :total_amount_payable, presence: true
  validates :duration, presence: true
end
