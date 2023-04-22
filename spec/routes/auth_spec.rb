require 'rails_helper'

describe Api::V1::AuthController, type: :routing do
  context 'routes' do
    it 'to create an auth' do
      expect(post: '/api/v1/auth').to route_to(
        controller: 'api/v1/auth',
        action: 'create'
      )
    end
  end
end
