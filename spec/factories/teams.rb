FactoryBot.define do
  factory :team do
    name { Faker::Name.name }
    current_points { Faker::Number.number(digits: 3) }
    game_mode
  end
end
