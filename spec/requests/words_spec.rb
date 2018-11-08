require 'rails_helper'

RSpec.describe 'Words API', type: :request do
  describe 'POST /words/random' do
    context 'when the request is valid' do
      before { post '/words/random', params: { words: ["jellybean", "snickersnack", "gummy"] } }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
  describe 'POST /words/rhyming' do
    context 'when the request is valid' do
      before { post '/words/rhyming', params: { word: "jelly" } }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
  describe 'POST /words/reverse' do
    context 'when the request is valid' do
      before { post '/words/reverse', params: { word: "jellybean" } }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
end