class Api::V1::UsersController < ApplicationController
  def index
    users = User.all

    return render json: { message: 'No users found!' }, status: :not_found if users.empty?

    render json: { data: users }, status: :ok
  end

  def create
    user = User.new(users_params)

    if user.save
      render json: { userId: user.id }, status: :created
    else
      render json: { message: user.errors.full_messages }, status: :bad_request
    end
  end

  private
  def users_params
    params.permit(:name, :email, :phone, :address, :password)
  end
end
