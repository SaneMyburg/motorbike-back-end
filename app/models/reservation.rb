class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorbike

  validates :date, presence: true
  validates :city, presence: true
end
