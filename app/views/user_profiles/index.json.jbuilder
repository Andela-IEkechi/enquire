json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :user_id, :date_of_birth, :gender, :address, :phone_number, :ethnicity, :occupation, :religion, :marital_status, :weight, :height
  json.url user_profile_url(user_profile, format: :json)
end
