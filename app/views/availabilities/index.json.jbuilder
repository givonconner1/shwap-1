json.array!(@availabilities) do |availability|
if availability.assigned.present?
  json.extract! availability, :id, :test_name, :title, :assigned
  json.start availability.start_time
  json.end availability.end_time
  json.url availability_url(availability, format: :html)
end
end