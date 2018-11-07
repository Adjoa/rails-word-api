require 'rails_helper'

RSpec.describe 'Words API', type: :request do
  
  # Test suite for POST /words/random
  describe 'POST /words/random' do
    # valid payload
    let(:valid_attributes) { { word_1: "meredith", word_2: "christina" } }

    context 'when the request is valid' do
      before { post '/words/random', params: valid_attributes }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      
      it 'returns one of the two words submitted' do
        expect(json).not_to be_empty
        expect(json['random_selection']).to eq(word_1).or eq(word_2)
      end
    end

    context 'when the request is invalid' do
      before { post '/words/random', params: {word_1: "", word_2: ""} }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body)
          .to match(/Operation failed: Words must be submitted to make a selection/)
      end
    end
  end
end