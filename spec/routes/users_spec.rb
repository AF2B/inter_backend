require 'rails_helper'

describe Api::V1::UsersController, type: :routing do
  context 'routes' do
    it 'to all users' do
      expect(get: '/api/v1/users').to route_to(
        controller: 'api/v1/users',
        action: 'index'
      )
    end
    it 'to a specific user' do
      expect(get: '/api/v1/users/1').to route_to(
        controller: 'api/v1/users',
        action: 'show',
        id: '1'
      )
    end
    it 'to create an user' do
      expect(post: '/api/v1/users').to route_to(
        controller: 'api/v1/users',
        action: 'create'
      )
    end
  end
end
