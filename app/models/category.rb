class Category < ApplicationRecord
	has_many :products_categories

	validates :name, presence: true
	validates :desc, presence: true

	def products
	end
end
