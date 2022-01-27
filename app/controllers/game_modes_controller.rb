

class GameModesController < ApplicationController
  before_action :load_game_modes

  def index
    render json: @game_modes
  end
  
  def show
    render json: game_mode
  end

  def create
    @game_mode = GameMode.new(game_mode_params)

    if @game_mode.save
      render json: @game_mode
    else
      render_json_validation_error @game_mode
    end
  end

  private

  def game_mode_params
    params.require(:game_mode).permit(:name, :total_points, :total_locations, configuration: {} )
  end
  
  def load_game_modes
    @game_modes ||= GameMode.all
  end

  def game_mode
    @game_mode ||= GameMode.find(params[:id])
  end
end
