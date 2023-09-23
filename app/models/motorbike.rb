class Motorbike < ApplicationRecord
  belongs_to :reservations
  belongs_to :motorbikes
end
