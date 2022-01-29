
class ResetGameMode < ApplicationService
  class UpdateError < StandardError; end

  def initialize(game_mode)
    @game_mode = game_mode
  end

  def call
    points = game_mode.total_points / game_mode.teams.count if game_mode.configuration['divide']

    Team.transaction do
      @game_mode.teams.each do |team|
        team.update(losing: false, current_points: points)
      end
    end

    Location.transaction do
      @game_mode.locations.each do |location|
        location.update(team: nil)
      end
    end

    self
  rescue UpdateError, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound, ActiveModel::ForbiddenAttributesError => e
    @errors = [e.message]
    self
  end
end