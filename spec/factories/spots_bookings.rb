FactoryBot.define do
  factory :spots_booking do
    association :spot
    association :booking
  end
end
