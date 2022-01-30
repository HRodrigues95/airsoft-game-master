# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

GameMode.create!(
  name:'Conquest', 
  total_points: 1000, 
  total_locations: 7,
  teams_attributes: [
    { name:'Templários', current_points: 0 },
    { name:'Mouros', current_points: 0 },
    { name:'Povo', current_points: 0 },
  ],
  locations_attributes: [
    { name:'A', points: 20 },
    { name:'B', points: 20 },
    { name:'C', points: 20 },
    { name:'D', points: 20 },
    { name:'E', points: 20 },
    { name:'F', points: 20 },
    { name:'G', points: 20 }
  ]
)
