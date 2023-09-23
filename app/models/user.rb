class User < ApplicationRecord
  has_many :reservations
  has_many :motorbikes

  validates :name, presence: true, length: { in: 3..25 }
end
