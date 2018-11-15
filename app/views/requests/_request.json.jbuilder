json.extract! request, :id, :comment, :created_at, :updated_at
json.url request_url(request, format: :json)
