class Api::V1::UsersController < ApplicationController
  def index
    users = User.all

    return render json: { message: 'No users found!' }, status: :not_found if users.empty?

    render json: user_json_structure(users)
  end

  def create
    unless required_params_present?
      return render json: { message: 'Required params are missing!' }, status: :bad_request
    end

    user = User.new(user_params)

    if user.save
      render json: { user: {id: user.id}, message: 'User created succefully!' }, status: :created
    else
      render json: { message: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    id = params[:id] if params[:id].present? && params[:id].to_i.positive?

    unless id && User.exists?(id)
      return render json: { message: 'User not found!' }, status: :not_found
    end

    user = User.find(id)
    render json: { data: user_json_uniq_user_structure(user) }
  end

  private
  def user_json_structure(data)
    data.map do |item|
      {
        data: {
          id: item.id,
          name: item.name,
          email: item.email,
          phone: item.phone,
          address: item.address,
          created_at: item.created_at,
          updated_at: item.updated_at
        }
      }
    end
  end

  def user_json_uniq_user_structure(user)
    data = {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      address: user.address,
      created_at: user.created_at,
      updated_at: user.updated_at
    }
    data
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :phone,
      :address,
      :password,
      :password_confirmation
    )
  end

  def required_params_present?
    required_params = [:name, :email, :phone, :address, :password, :password_confirmation]
    required_params.all? { |param| user_params[param].present? }
  end
end
