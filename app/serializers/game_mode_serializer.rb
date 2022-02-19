class GameModeSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points, :total_locations, :configuration, :ongoing, :update_tick
end
