class TeamTickLosingJob < ApplicationJob
  queue_as :default

  def perform(game_mode)
    Team.transaction do
      @game_mode.teams.each do |team|
        team.update!(current_points: team.current_points-1)
      end
    end

    game_mode.reload

    TeamTickLosingJob.perform_in(1, game_mode) if game_mode.ongoing
  end
end
