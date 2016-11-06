json.extract! advertiser, :id, :first_name, :second_name, :email, :company_name, :city, :phone_number, :website, :created_at, :updated_at
json.url advertiser_url(advertiser, format: :json)