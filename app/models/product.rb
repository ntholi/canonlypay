class Product < ApplicationRecord
  belongs_to :product_category
  has_many :adverts
  has_many :posts
  # belongs_to :company, required: false

  def to_s
  	"#{name} @ R#{price}"
  end
end
