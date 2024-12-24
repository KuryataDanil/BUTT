# frozen_string_literal: true

class Api::SpotsBookingController < ApplicationController
  # POST /api/spots_booking
  def create
    spots_booking = SpotsBooking.new(spots_booking_params)
    if spots_booking.save
      render json: { message: 'Spot linked to booking successfully', spots_booking: spots_booking }, status: :created
    else
      render json: { errors: spots_booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def spots_booking_params
    params.require(:spots_booking).permit(:booking_id, :spot_id)
  end
end
