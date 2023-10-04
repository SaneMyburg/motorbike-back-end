class Motorbike < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 255 }, uniqueness: true
  validates :description, length: { maximum: 1000 }
  validates :finance_fee, presence: true
  validates :total_amount_payable, presence: true
  validates :duration, presence: true

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] = %i[price finance_fee total_amount_payable]
    super(options).tap do |hash|
      hash['price'] = price.to_f
      hash['finance_fee'] = finance_fee.to_f
      hash['total_amount_payable'] = total_amount_payable.to_f
    end
  end
end
