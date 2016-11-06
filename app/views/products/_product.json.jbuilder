json.extract! product, :id, :category, :name, :price, :year_made, :description, :pictures, :advertiser_id, :created_at, :updated_at
json.url product_url(product, format: :json)