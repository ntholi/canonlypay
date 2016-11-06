json.extract! advert, :id, :advertiser_id, :product_id, :created_at, :updated_at
json.url advert_url(advert, format: :json)