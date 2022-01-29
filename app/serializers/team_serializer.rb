class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_points, :losing
end
