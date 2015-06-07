json.array!(@hospital_verification_requests) do |hospital_verification_request|
  json.extract! hospital_verification_request, :id, :user_id, :hospital_id, :message
  json.url hospital_verification_request_url(hospital_verification_request, format: :json)
end
