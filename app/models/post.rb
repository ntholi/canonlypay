class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :product

  def owner
    user.full_name
  end
end
