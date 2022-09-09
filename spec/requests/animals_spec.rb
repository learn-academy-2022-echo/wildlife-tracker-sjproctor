require 'rails_helper'

RSpec.describe "Animals", type: :request do

  describe 'post requests' do

    it 'gets a 422 error when an animal is not created' do
      post '/animals', params: { 
        animal: { 
          common_name: nil, 
          scientific_binomial: nil
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'gets a 422 error when an animal is not created' do
      post '/animals', params: { 
        animal: { 
          common_name: 'Mule Deer', 
          scientific_binomial: 'Mule Deer'
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
