require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  context 'when user send an get request to user route' do

    let(:empty_users) { [] }
    let(:user) { create(:user) }

    before do
      get api_v1_users_path
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a JSON response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns an array with objects containing specific keys' do
      schema = {
        data: [
          {
            id: Integer,
            name: String,
            email: String,
            phone: String,
            address: String,
            created_at: String,
            updated_at: String
          }
        ]
      }

      expect(response.body).to match(schema)
    end

    it 'return these keys' do
      expect(response.body).to include('id', 'name', 'email', 'phone', 'address', 'created_at', 'updated_at')
    end

    it 'returns a not found status' do
      response = empty_users
      expect(response).to be_empty
      expect(response).to eq(empty_users)
      expect(response).to have_attributes(empty?: true)
      expect(response).to have_http_status(:not_found)
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
