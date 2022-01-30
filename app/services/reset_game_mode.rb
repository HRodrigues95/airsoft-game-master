
class ResetGameMode < ApplicationService
  class UpdateError < StandardError; end

  def initialize(game_mode)
    @errors = []
    @game_mode = game_mode
  end

  def call
    Team.transaction do
      @game_mode.teams.each do |team|
        team.update(losing: false, current_points: 0)
      end
    end

    Location.transaction do
      @game_mode.locations.each do |location|
        location.update(team: nil)
      end
    end

    self
    rescue UpdateError, ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
      @errors = [e.message]
      self
  end
end
