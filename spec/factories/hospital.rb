FactoryGirl.define do
  factory :hospital do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    classification { Faker::Lorem.sentence(2) }
    description { Faker::Lorem.sentence }
    phone_number { Faker::PhoneNumber.cell_phone }
    manager { create(:user, :manager)}
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'accesories', 'avatar.png')) }

    trait :verified do
      verified true
    end

    trait :un_verified do
      verified false
    end
  end
end