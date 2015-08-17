FactoryGirl.define do
  factory :answer do
    content { Faker::Lorem.sentence }
    question { create(:question) }
    user { create(:user, role: 'doctor', verified: true) }
  end
end