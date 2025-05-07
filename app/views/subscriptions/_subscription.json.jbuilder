json.extract! subscription, :id, :name, :url, :active, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
