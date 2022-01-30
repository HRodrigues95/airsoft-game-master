class Location < ApplicationRecord
  validates :name, presence: true
  validates :points, presence: true

  belongs_to :game_mode
  belongs_to :team, counter_cache: :true, optional: true

  def captured?
    self.team.present?
  end
end
