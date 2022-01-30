class Team < ApplicationRecord
  validates :name,  presence: true

  belongs_to :game_mode
  has_many :locations
end
