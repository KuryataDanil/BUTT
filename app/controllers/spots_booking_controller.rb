# frozen_string_literal: true

class SpotsBookingController < ApplicationController
  # POST /api/spots_booking
  def create
    spots_booking = SpotsBooking.new(spots_booking_params)
    if spots_booking.save
      Spot.find(spots_booking_params[:spot_id]).destroy!
      redirect_to dashboard_path, notice: "Добро пожаловать!"#, status: :ok
    else
      render json: { errors: spots_booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def spots_booking_params
    params.require(:spots_booking).permit(:booking_id, :spot_id)
  end
end
