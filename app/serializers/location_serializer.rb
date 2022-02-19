class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :points, :captured, :current_team, :capture_bonus

  def captured
    object.captured?
  end

  def current_team
    object.team
  end
end