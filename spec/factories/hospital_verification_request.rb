FactoryGirl.define do
  factory :hospital_verification_request do
    user { create(:user, :client) }
    hospital { create(:hospital, :un_verified) }
    message { Faker::Lorem.sentence }
  end
end