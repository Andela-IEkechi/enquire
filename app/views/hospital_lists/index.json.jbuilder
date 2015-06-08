json.array!(@hospital_lists) do |hospital_list|
  json.extract! hospital_list, :id, :user_id, :hospital_id
  json.url hospital_list_url(hospital_list, format: :json)
end
