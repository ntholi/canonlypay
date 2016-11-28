class Advert < ApplicationRecord
  belongs_to :advertiser
  belongs_to :product
  accepts_nested_attributes_for :advertiser
  accepts_nested_attributes_for :product
end
