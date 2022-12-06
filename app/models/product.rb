class Product < ApplicationRecord
	validates :name, presence: true, length: { maximum: 100 }
	validates :sku, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :desc, presence: true, length: { maximum: 500 }
end
