require 'JWTWrapper'

class Api::V1::AuthController < ApplicationController
  include JWTWrapper

  def create
    headers = get_headers

    unless valid_headers?(headers)
      return render json: { status: 'ERROR', message: 'Invalid headers' }, status: :bad_request
    end

    token = headers[:authorization]
    payload = JWTWrapper.decode(token)
    email = payload[0]['email']
    password = payload[0]['password']

    user = User.find_by(email: email)

    unless user && user[:password] == password
      return render json: { status: 'ERROR', message: 'Invalid credentials' }, status: :unauthorized
    end

    payload = {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      created_at: user.created_at,
      updated_at: user.updated_at
    }

    token = JWTWrapper.encode(payload)

    render json: { token: token, status: 'SUCCESS', message: 'User logged in' }, status: :ok
  end

  private

  def valid_headers?(headers)
    headers.values.all?(&:present?)
  end

  def get_headers
    {
      authorization: request.headers['Authorization'],
      content_type: request.headers['Content-Type'],
      accept: request.headers['Accept'],
      app_key: request.headers['AppKey']
    }
  end
end
