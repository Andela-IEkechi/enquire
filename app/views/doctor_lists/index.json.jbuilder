json.array!(@doctor_lists) do |doctor_list|
  json.extract! doctor_list, :id, :user_id, :hospital_id
  json.url doctor_list_url(doctor_list, format: :json)
end
