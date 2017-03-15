class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :company, required: false

  def to_s
  	"#{name} @ R#{price}"
  end
end
