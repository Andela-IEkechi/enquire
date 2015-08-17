FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    bio { Faker::Lorem.sentence }
    date_of_birth { Faker::Date.backward(7860) }
    gender 'Male'
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    ethnicity { Faker::Lorem.words(1) }
    occupation { Faker::Lorem.words(2) }
    religion { Faker::Lorem.words(2) }
    marital_status 'Single'
    weight 65
    height 1.72
  end
end