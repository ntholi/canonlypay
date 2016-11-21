class ProductCategory < ApplicationRecord
	has_many :products
	validates :category, presence: true
	validates_uniqueness_of :category, message: "Category already exists"
	
	def to_s
		category
	end
end
