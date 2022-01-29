class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :points, :captured, :current_team

  def captured
    object.captured?
  end

  def current_team
    object.team
  end
end