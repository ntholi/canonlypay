json.extract! post, :id, :body, :min_price, :max_price, :user_id, :product_id, :created_at, :updated_at
json.url post_url(post, format: :json)