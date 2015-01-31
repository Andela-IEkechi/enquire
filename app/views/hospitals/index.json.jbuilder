json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :name, :description, :image, :verified, :address, :type
  json.url hospital_url(hospital, format: :json)
end
