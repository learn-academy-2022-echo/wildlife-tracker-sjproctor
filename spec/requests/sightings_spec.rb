require 'rails_helper'

RSpec.describe "Sightings", type: :request do
  describe 'post requests' do
    let(:animal) {
    Animal.create(
        common_name: 'Mule Deer',
        scientific_binomial: 'Odocoileus hemionus'
      )
    }

    it 'gets a 422 error when a sighting is not created' do
      post '/sightings', params: { 
        sighting: { 
          latitude: nil, 
          longitude: nil, 
          date: nil,
          animal_id: animal.id
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end
end
