json.extract! company, :id, :company_name, :location, :phone_number, :website, :created_at, :updated_at
json.url company_url(company, format: :json)
