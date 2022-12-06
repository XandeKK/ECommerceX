class Discount < ApplicationRecord
  belongs_to :product

  validates :name, presence: true, length: { maximum: 50 }
  validates :desc, presence: true, length: { maximum: 300 }
  validates :discount_percent, presence: true, numericality: {
    greater_than_or_equal_to: 5, less_than_or_equal_to: 75
  }

  def active?
    self.active
  end
end
