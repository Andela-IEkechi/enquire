FactoryGirl.define do
  factory :article do
    content { Faker::Lorem.sentence }
    title { Faker::Lorem.word }
    doctor { create(:user, :verified_doctor) }
  end
end