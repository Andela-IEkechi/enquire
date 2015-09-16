FactoryGirl.define do
  factory :doctor_list do
    user { create(:user, :verified_doctor) }
    hospital { create(:hospital, :verified) }
  end
end