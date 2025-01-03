FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
    role { "user" }

    trait :admin do
      role { "admin" }
    end
  end
end
