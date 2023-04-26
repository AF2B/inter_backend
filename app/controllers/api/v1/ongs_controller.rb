class Api::V1::OngsController < ApplicationController
  def index
    ong = Ong.all

    return render json: { message: 'No ong found!' }, status: :not_found if ong.empty?

    render json: {data: ong}, status: :ok
  end

  def create
    ong = Ong.new(ong_params)

    if ong.save
      render json: {ongId: ong.id}, status: :created
    else
      render json: { message: ong.errors.full_messages }, status: :bad_request
    end
  end

  def outofstock
    ong = Ong.find(outofstock_params[:ong_id])

    if ong
      outofstock = Outofstock.new(outofstock_params)
      if outofstock.save
        render json: { message: 'Out of stock successfully registered!' }, status: :created
      else
        render json: { message: outofstock.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: 'Ong not found!' }, status: :not_found
    end
  end

  def list_out_of_stock
    ong = Ong.find(params[:ong_id])

    if ong
      outofstock = Outofstock.where(ong_id: params[:ong_id])

      if outofstock.empty?
        render json: { message: 'No out of stock found!' }, status: :not_found
      else
        render json: {data: outofstock}, status: :ok
      end
    else
      render json: { message: 'Ong not found!' }, status: :not_found
    end
  end

  private
  def ong_params
    params.permit(:name, :email, :phone, :address, :password, :cnpj)
  end

  def outofstock_params
    params.permit(:ong_id, :product, :quantity, :weight)
  end
end
