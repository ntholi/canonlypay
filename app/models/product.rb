class Product < ApplicationRecord
  belongs_to :advertiser

  CATEGORIES = ["", "Animals", "Art & Rare Items", "Bicyles", "Cameras", "Clothing", "Computers", "Computer Accessories", "Cosmetics", "Farming and Industries", "Furniture", "Gaming & Console", "Home, Garden & Tools", "Jewellery & Accessories", "Jobs Available", "Job Seekers", "Mobile Phones", "Property For Rent", "Property for Sale", "Scooters & Motocyles", "Sports & Outdoor", "Tablets", "Toys & Dolls", "TV, Radio & Visual", "Vehicles", "Vehicle Parts", "Others"]
  def to_s
  	"#{name} at #{price}"
  end
end
