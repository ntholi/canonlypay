json.extract! user, :id, :display_name, :first_name, :second_name, :gender, :email, :city, :birthday, :phone_number, :created_at, :updated_at
json.url user_url(user, format: :json)