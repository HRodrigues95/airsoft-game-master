require 'rails_helper'

describe Api::TeamsController, type: :request do
  let(:mode) { create(:game_mode) }
  let(:base_url) { "/api/game_modes/#{mode.id}/teams" }

  describe "GET /api/game_modes/:game_mode_id/teams" do
    let!(:team_opfor)   { create(:team, game_mode: mode) }
    let!(:team_blufor)  { create(:team, game_mode: mode) }
    let!(:team_randfor) { create(:team, game_mode: mode) }

    context 'when success' do
      it 'returns all the teams of the mode' do
        get base_url

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body[0]['id']).to eql team_opfor.id
        expect(body[1]['id']).to eql team_blufor.id
        expect(body[2]['id']).to eql team_randfor.id
      end
    end
  end

  describe "PATCH /api/game_modes/:game_mode_id/teams/:id" do
    let!(:team_opfor)   { create(:team, current_points: 500, game_mode: mode) }
    let(:params) do
      {
        team: {
          name: 'OPFOR',
          current_points: 600
        }
      }
    end

    context 'when success' do
      it 'returns all the teams of the mode' do
        patch "#{base_url}/#{team_opfor.id}", params: params

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['name']).to eq 'OPFOR'
        expect(body['current_points']).to eq 600
      end
    end
  end
  
  describe "PATCH /api/game_modes/:game_mode_id/teams/:id/increase" do
    let!(:team_opfor)   { create(:team, current_points: 500, game_mode: mode) }
    let(:params) do
      { team: { amount: 50 } }
    end

    context 'when success' do
      it 'returns all the teams of the mode' do
        patch "#{base_url}/#{team_opfor.id}/increase", params: params

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['current_points']).to eq 550
      end
    end
  end
  
  
  describe "PATCH /api/game_modes/:game_mode_id/teams/:id/decrease" do
    let!(:team_opfor)   { create(:team, current_points: 500, game_mode: mode) }
    let(:params) do
      { team: { amount: 50 } }
    end 

    context 'when success' do
      it 'returns all the teams of the mode' do
        patch "#{base_url}/#{team_opfor.id}/decrease", params: params

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['current_points']).to eq 450
      end
    end
  end
end
