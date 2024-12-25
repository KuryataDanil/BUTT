# frozen_string_literal: true

class BookingsController < ApplicationController
  # GET /api/bookings
  def index
    bookings = Booking.where(user_id: params[:user_id])
    render json: bookings, status: :ok
  end

  # POST /api/bookings
  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: { message: 'Booking created successfully', booking: booking }, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/bookings/:id
  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    render json: { message: 'Booking deleted successfully' }, status: :ok
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :user_id, :start_time, :end_time, :status, :price)
  end
end
