json.extract! company, :id, :first_name, :last_name, :email, :company_name, :location, :phone_number, :website, :created_at, :updated_at
json.url company_url(company, format: :json)