class AdvertComment < ApplicationRecord
  belongs_to :user
  belongs_to :advert
end
