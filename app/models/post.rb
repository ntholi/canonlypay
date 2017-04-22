class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :post_comments
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :product
end
