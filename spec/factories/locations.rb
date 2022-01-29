FactoryBot.define do
  factory :location do
    name { Faker::Name.name }
    points { Faker::Number.number(digits: 2) }
    game_mode
    team
  end
end
