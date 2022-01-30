
module Api
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

    def destroy
      if game_mode.destroy
        render json: game_mode
      else
        render_json_validation_error game_mode
      end
    end

    def start_game
      if game_mode.update(ongoing: true)
        TeamTickLosingJob.perform_later(game_mode)

        render json: game_mode
      else
        render_json_validation_error @game_mode
      end
    end
    
    def end_game
      if game_mode.update(ongoing: false)
        service = ResetGameMode.call(game_mode)

        if service.success?
          render json: game_mode
        else
          render_service_error service
        end
      else
        render_json_validation_error game_mode
      end
    end
  
    private
  
    def game_mode_params
      params.require(:game_mode).permit(
        :name, :total_points, :total_locations, 
        teams_attributes: [:name, :current_points],
        locations_attributes: [:name, :points],
        configuration: {} 
      )
    end
    
    def load_game_modes
      @game_modes = GameMode.all
    end
  
    def game_mode
      @game_mode ||= GameMode.find(params[:id] || params[:game_mode_id])
    end
  end
end
