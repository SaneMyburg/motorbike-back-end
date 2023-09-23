class Reservation < ApplicationRecord
    belogs_to :user
    belongs_to :motorbikes
    validates :date, city, presence: true
end
