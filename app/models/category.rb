class Category < ApplicationRecord
	has_many :product_categories

	validates :name, presence: true
	validates :desc, presence: true

	def products
	end
end
