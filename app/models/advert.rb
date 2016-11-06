class Advert < ApplicationRecord
  belongs_to :advertiser
  belongs_to :product
end
