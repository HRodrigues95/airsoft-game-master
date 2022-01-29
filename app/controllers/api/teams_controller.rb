
module Api
    class TeamsController < ApplicationController
      before_action :load_game_mode
    
      def index
        render json: teams
      end
      
      def show
        render json: team
      end

      def update
        if team.update(team_params)
          render json: team
        else
          render_json_validation_error team
        end
      end
      
      def increase_points
        if team.update(current_points:  team.current_points + action_params[:amount].to_i)
          render json: team
        else
          render_json_validation_error team
        end
      end
    
      def decrease_points
        if team.update(current_points: team.current_points - action_params[:amount].to_i)
          render json: team
        else
          render_json_validation_error team
        end
      end

      private
    
      def team_params
        params.require(:team).permit(:name, :current_points, :losing)
      end

      def action_params
        params.require(:team).permit(:amount)
      end

      def load_game_mode
        @game_mode = GameMode.find(params[:game_mode_id])
      end
      
      def team
        @team ||= teams.find(params[:id] || params[:team_id])
      end
      
      def teams
        @teams ||= @game_mode.teams
      end
    end
  end
