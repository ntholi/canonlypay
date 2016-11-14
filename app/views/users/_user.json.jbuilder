json.extract! user, :id, :display_name, :first_name, :last_name, :email, :gender, :location, :birthday, :phone_number, :created_at, :updated_at
json.url user_url(user, format: :json)