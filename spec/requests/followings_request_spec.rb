require 'rails_helper'

RSpec.describe 'Followings', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/followings/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/followings/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/followings/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
