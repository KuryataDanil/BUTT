FactoryBot.define do
  factory :space do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    opening_time { "08:00" }
    closing_time { "18:00" }
    association :creator, factory: :user
  end
end
