# frozen_string_literal: true

class Api::SpotsController < ApplicationController
  # GET /api/spaces/:space_id/spots
  def index
    space = Space.find(params[:space_id])
    render json: space.spots, status: :ok
  end

  # POST /api/spaces/:space_id/spots
  def create
    spot = Spot.new(spot_params)
    spot.space_id = params[:space_id]
    if spot.save
      render json: { message: 'Spot created successfully', spot: spot }, status: :created
    else
      render json: { errors: spot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /api/spots/delete (bulk delete)
  def bulk_delete
    Spot.where(id: params[:ids]).destroy_all
    render json: { message: 'Spots deleted successfully' }, status: :ok
  end

  private

  def spot_params
    params.require(:spot).permit(:x, :y, :size, :num, :price, :time, :time_measure)
  end
end
