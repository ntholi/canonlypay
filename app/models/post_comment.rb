class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def owner
	  user.display_name
	end
	
	def to_s
	  comment
	end
end
