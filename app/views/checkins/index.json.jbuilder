json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :name, :address, :latitude, :longitude
  json.url checkin_url(checkin, format: :json)
end
