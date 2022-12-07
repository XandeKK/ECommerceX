class Product < ApplicationRecord
	has_many :products_categories
	has_one :discount
	
	validates :name, presence: true, length: { maximum: 100 }
	validates :sku, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :desc, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: {
		greater_than_or_equal_to: 0.1
  }

	def has_discount?
		Discount.find_by(product: self).active?
	end
end
