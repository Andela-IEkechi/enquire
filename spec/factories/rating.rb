FactoryGirl.define do
  factory :rating do
    article { create(:article) }
    score { rand 5 }
    user { create(:user) }
  end
end