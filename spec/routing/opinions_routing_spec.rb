require 'rails_helper'

RSpec.describe OpinionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/opinions').to route_to('opinions#index')
    end

    it 'routes to #new' do
      expect(get: '/opinions/new').to route_to('opinions#new')
    end

    it 'routes to #show' do
      expect(get: '/opinions/1').to route_to('opinions#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/opinions/1/edit').to route_to('opinions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/opinions').to route_to('opinions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/opinions/1').to route_to('opinions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/opinions/1').to route_to('opinions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/opinions/1').to route_to('opinions#destroy', id: '1')
    end
  end
end
