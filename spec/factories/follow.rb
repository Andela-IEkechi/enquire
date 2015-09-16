FactoryGirl.define do
  factory :follow do
    user { create(:user) }
    question { create(:question) }
  end
end