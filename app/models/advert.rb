class Advert < ApplicationRecord
  belongs_to :company
  belongs_to :product
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :product
end
