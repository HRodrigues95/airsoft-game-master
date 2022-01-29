require 'rails_helper'

describe Api::TeamsController, type: :request do
  let(:mode) { create(:game_mode) }
  let(:base_url) { "/api/game_modes/#{mode.id}/locations" }

  describe "GET /api/game_modes/:game_mode_id/locations/:id" do
    let!(:opfor_team)   { create(:team, game_mode: mode) }
    let!(:location_a)   { create(:location, name: 'A', points: 40, team: opfor_team, game_mode: mode) }

    context 'when success' do
      it 'returns all the teams of the mode' do
        get "#{base_url}/#{location_a.id}"

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['name']).to eq location_a.name
        expect(body['points']).to eq location_a.points
        expect(body['captured']).to be_truthy
        expect(body['current_team']['id']).to eq opfor_team.id
      end
    end
  end

  describe "PATCH /api/game_modes/:game_mode_id/locations/:id" do
    let!(:opfor_team)   { create(:team, game_mode: mode) }
    let!(:location_a)   { create(:location, game_mode: mode) }
    let(:params) do
      { location: { team_id: opfor_team.id } }
    end

    context 'when success' do
      it 'returns the updated location' do
        patch "#{base_url}/#{location_a.id}", params: params

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['name']).to eq location_a.name
        expect(body['points']).to eq location_a.points
        expect(body['captured']).to be_truthy
        expect(body['current_team']['id']).to eq opfor_team.id
      end
    end
  end
end
