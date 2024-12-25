FactoryBot.define do
  factory :space_object do
    x { rand(0..100) }
    y { rand(0..100) }
    size_x { rand(1..10) }
    size_y { rand(1..10) }
    angle { rand(0..360) }
    association :space
  end
end
