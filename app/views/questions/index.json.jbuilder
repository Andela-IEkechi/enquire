json.array!(@questions) do |question|
  json.extract! question, :id, :caption, :body, :user_id, :doctor_id
  json.url question_url(question, format: :json)
end
