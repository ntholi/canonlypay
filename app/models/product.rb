class Product < ApplicationRecord
  belongs_to :product_category
  has_many :adverts
  has_many :posts
  # belongs_to :company, required: false

  def summary
  	"#{name.indefinite_article.capitalize} #{name} for R#{price}"
  end
end
