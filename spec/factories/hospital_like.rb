FactoryGirl.define do
  factory :hospital_like do
    user { create(:user, :client) }
    hospital { create(:hospital, :verified) }
  end
end