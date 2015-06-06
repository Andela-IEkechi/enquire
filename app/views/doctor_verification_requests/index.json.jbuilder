json.array!(@doctor_verification_requests) do |doctor_verification_request|
  json.extract! doctor_verification_request, :id, :user_id, :hospital_id, :message
  json.url doctor_verification_request_url(doctor_verification_request, format: :json)
end
