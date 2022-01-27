require 'rails_helper'

describe Api::GameModesController, type: :request do
  let(:base_url) { '/api/game_modes' }

  describe "GET /api/game_modes" do
    let!(:game_1) { create(:game_mode) }
    let!(:game_2) { create(:game_mode) }
    let!(:game_3) { create(:game_mode) }

    context 'when success' do
      it 'returns Game Mode' do
        get base_url

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body[0]['id']).to eql game_1.id
        expect(body[1]['id']).to eql game_2.id
        expect(body[2]['id']).to eql game_3.id
      end
    end
  end

  describe "GET /api/game_modes/:id" do
    let!(:game_1) { create(:game_mode) }
    let!(:game_2) { create(:game_mode) }
    let!(:game_3) { create(:game_mode) }

    context 'when success' do
      it 'returns Game Mode' do
        get "#{base_url}/#{game_2.id}" 

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['id']).to eql game_2.id
      end
    end
  end
  
  describe "POST /api/game_modes" do
    context 'when error' do
      let(:params) do 
        {
          game_mode: {
            total_points: 1000,
            total_locations: 6
          }
        }
      end

      it 'sending a bad request' do
        post base_url, params: params
        
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when success' do
      let(:params) do 
        {
          game_mode: {
            name: 'Teste',
            total_points: 1000,
            total_locations: 6
          }
        }
      end

      it 'returns Game Mode' do
        post base_url, params: params

        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)

        expect(body['name']).to eq 'Teste'
        expect(body['total_points']).to eq 1000
        expect(body['total_locations']).to eq 6
      end
    end
  end
end
