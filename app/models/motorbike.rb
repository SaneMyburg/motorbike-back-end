class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 } 
end
