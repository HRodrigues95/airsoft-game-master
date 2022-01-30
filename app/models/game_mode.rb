class GameMode < ApplicationRecord
  validates :name, presence: true
  validates :total_points, presence: true

  has_many :teams, dependent: :destroy
  has_many :locations, dependent: :destroy
  
  accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :locations
end
