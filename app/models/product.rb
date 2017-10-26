class Product < ApplicationRecord
  belongs_to :product_category
  has_many :adverts
  has_many :posts
  validates_presence_of :name;
  # belongs_to :company, required: false

  def summary
    short_product_description = ""
    if !name.blank?
      short_product_description = "#{name.indefinite_article.capitalize} #{name}"
    end
  	"#{short_product_description} for R#{price}"
  end
end
