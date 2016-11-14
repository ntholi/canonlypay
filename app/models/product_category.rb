class ProductCategory < ApplicationRecord
	has_many :products

	def to_s
		category
	end
end
