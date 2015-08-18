FactoryGirl.define do
  factory :doctor_verification_request do
    message { Faker::Lorem.sentence }
    user { create(:user, :un_verified_doctor) }
    hospital { create(:hospital, :verified) }
  end
end