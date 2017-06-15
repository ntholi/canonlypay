class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def to_s
	  comment
	end
end
