json.extract! event, :id, :start_date, :end_date, :title, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
