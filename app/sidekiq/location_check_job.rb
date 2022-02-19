class LocationCheckJob
  include Sidekiq::Job

  def perform(game_mode_id)
    @game_mode = GameMode.find(game_mode_id)
    return unless @game_mode.present?
    return unless @game_mode.ongoing

    @game_mode.locations.each do |loc|
      loc.team.update( current_points: loc.team.current_points + loc.points) if loc.team.present?
    end

    @game_mode.reload
    LocationCheckJob.perform_at(@game_mode.update_tick.minutes.from_now,  game_mode_id) if @game_mode.ongoing
  end
end
