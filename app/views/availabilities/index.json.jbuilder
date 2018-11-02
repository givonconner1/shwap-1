json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :test_name
  json.start availability.start_time
  json.end availability.end_time
  json.url availability_url(availability, format: :html)
end