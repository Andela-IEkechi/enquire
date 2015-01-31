json.array!(@reviews) do |review|
  json.extract! review, :id, :hospital_id, :user_id, :content
  json.url review_url(review, format: :json)
end
