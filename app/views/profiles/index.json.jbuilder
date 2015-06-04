json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :date_of_birth, :gender, :address, :phone_number, :ethnicity, :occupation, :religion, :marital_status, :weight, :height
  json.url profile_url(profile, format: :json)
end
