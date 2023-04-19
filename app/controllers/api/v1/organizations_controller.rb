class Api::V1::OrganizationsController < ApplicationController
  def index
    organizations = Organization.all

    return render json: { message: 'No organizations found!' }, status: :not_found if organizations.empty?

    render json: organizations
  end
end
