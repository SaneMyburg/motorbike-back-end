class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorbikes, dependent: :destroy

  validates :name, presence: true, length: { in: 3..25 }, uniqueness: true
  validate :no_whitespace

  private

  def no_whitespace
    return unless name.present? && name.include?(' ')

    errors.add(:name, 'cannot contain white spaces')
  end
end
