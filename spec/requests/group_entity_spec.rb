require 'rails_helper'

RSpec.describe 'GroupEntities', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/group_entity/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/group_entity/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/group_entity/new'
      expect(response).to have_http_status(:success)
    end
  end
end
