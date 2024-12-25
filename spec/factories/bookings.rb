FactoryBot.define do
  factory :booking do
    start_time { Faker::Time.forward(days: 1, period: :morning) }
    end_time { Faker::Time.forward(days: 1, period: :afternoon) }
    status { %w[pending confirmed canceled].sample }
    price { Faker::Commerce.price(range: 50.0..500.0) }
    association :space
    association :user
  end
end
