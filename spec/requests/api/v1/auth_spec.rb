require 'rails_helper'
require 'jwt'

describe Api::V1::AuthController, type: :request do
  context 'when user send an post request to auth route' do

    let(:user_token) { email: 'test@test.com', password: '12345678' }
    user_token = JWT.encode(user_token)
    headers = {
      Authorization: user_token,
      Accept: 'application/json'
      ContentType: 'application/json'
      AppKey: '1'
    }

    before do
      post api_v1_auth_path, headers: headers
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a JSON response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns an object containing specific keys' do
      schema = {
        user: {
          id: Integer
        },
        message: String
      }

      expect(response.body).to match(schema)
    end

    it 'return these keys' do
      expect(response.body).to include('id', 'message')
    end

    it 'returns a not found status' do
      pending 'Not implemented yet'
    end

    it 'returns a bad request status' do
      pending 'Not implemented yet'
    end

    it 'returns a unprocessable entity status' do
      pending 'Not implemented yet'
    end

    it 'returns a created status' do
      pending 'Not implemented yet'
    end
  end
end
