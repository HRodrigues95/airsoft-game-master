
FactoryBot.define do
  factory :game_mode do
    name { Faker::Name.name }
    total_points { Faker::Number.number(digits: 4) }
    total_locations { Faker::Number.number(digits: 1) }
  end
end
