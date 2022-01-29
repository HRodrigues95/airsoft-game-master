class GameModeSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points, :total_locations, :configuration

  has_many :teams
  has_many :locations
end
