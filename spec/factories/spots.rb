FactoryBot.define do
  factory :spot do
    x { rand(0..100) }
    y { rand(0..100) }
    size { rand(1..10) }
    num { rand(1..100) }
    price { Faker::Commerce.price(range: 10.0..100.0) }
    time { rand(1..24) }
    time_measure { %w[hour day].sample }
    association :space
  end
end
