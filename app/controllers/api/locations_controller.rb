module Api
  class LocationsController < ApplicationController
    before_action :load_game_mode

    def index
      render json: locations
    end
    
    def show
      render json: location
    end

    def create
      @location = @game_mode.locations.build(location_params)

      if @location.save
        render json: @location
      else
        render_json_validation_error @location
      end
    end

    def update
      if location.update(location_params)
        render json: location
      else
        render_json_validation_error location
      end
    end

    def destroy
      if location.destroy
        render json: location
      else
        render_json_validation_error location
      end
    end

    private

    def location_params
      params.require(:location).permit(:name, :points, :team_id)
    end

    def load_game_mode
      @game_mode = GameMode.find(params[:game_mode_id])
    end
    
    def locations
      @locations ||= @game_mode.locations
    end
    
    def location
      @location ||= @game_mode.locations.find(params[:id])
    end
  end
end
