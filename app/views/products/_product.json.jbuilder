json.extract! product, :id, :name, :product_category_id, :price, :year_made, :description, :advertiser_id, :created_at, :updated_at
json.url product_url(product, format: :json)