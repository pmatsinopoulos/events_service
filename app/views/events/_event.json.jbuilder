json.extract! event, :id, :name, :starts_at, :ends_at, :longitude, :latitude, :active, :created_at, :updated_at
json.url event_url(event, format: :json)
