FactoryGirl.define do
  factory :review do
    user { create(:user, :client)}
    hospital { create(:hospital, :verified)}
    content Faker::Lorem.sentence
  end
end