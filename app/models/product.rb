class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :advertiser
end
