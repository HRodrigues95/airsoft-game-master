class Location < ApplicationRecord
  default_scope { order(name: :asc) }
 
  validates :name, presence: true
  validates :points, presence: true

  belongs_to :game_mode
  belongs_to :team, optional: true

  def captured?
    self.team.present?
  end
end
