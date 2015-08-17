FactoryGirl.define do
  factory :question do
    caption { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    user { create(:user) }
  end
end