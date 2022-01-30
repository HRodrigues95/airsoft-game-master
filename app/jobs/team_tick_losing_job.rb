class TeamTickLosingJob < ApplicationJob
  queue_as :default

  def perform(game_mode)
    return unless game_mode.ongoing
    tick_start = game_mode.configuration['bleed_at'].to_i if game_mode.configuration.present?
    
    # Verificar se alguma já foi capturada
    captured_any = game_mode.locations.where.not(team: nil).present?

    # Qual a equipa com mais Capturas
    winning_team = game_mode.teams.order("teams.locations_count DESC").first
  
    if captured_any && winning_team.locations_count >= tick_start
      Team.transaction do
        game_mode.teams.where.not(team: winning_team).each do |team|
          team.update!(current_points: team.current_points-1) 
        end
      end
    end

    game_mode.reload
    TeamTickLosingJob.perform_in(1, game_mode) if game_mode.ongoing
  end
end
