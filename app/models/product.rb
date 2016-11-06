class Product < ApplicationRecord
  belongs_to :advertiser

  def to_s
  	"#{name} at #{price}"
  end
end
