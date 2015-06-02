json.array!(@doctor_profiles) do |doctor_profile|
  json.extract! doctor_profile, :id, :doctor_id, :date_of_birth, :gender, :address, :phone_number, :ethnicity, :occupation, :religion, :marital_status, :weight, :height, :year_of_grad, :specialization
  json.url doctor_profile_url(doctor_profile, format: :json)
end
