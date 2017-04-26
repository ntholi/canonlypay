json.extract! notification, :id, :content, :link, :created_at, :updated_at
json.url notification_url(notification, format: :json)