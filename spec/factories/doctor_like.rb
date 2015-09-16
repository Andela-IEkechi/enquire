FactoryGirl.define do
  factory :doctor_like do
    user { create(:user, :client) }
  end
end