FactoryGirl.define do
  factory :hospital_list do
    user { create(:user, :client) }
    hospital { create(:hospital, :verified) }
  end
end