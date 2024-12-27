# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_space

  # GET /api/bookings
  def index
    bookings = Booking.where(user_id: params[:user_id])
    render json: bookings, status: :ok
  end

  def new
    @spot = @space.spots.find_by(id: params[:spot_id])
    unless @spot
      redirect_to space_path(@space), alert: "Указанное место не найдено."
    end
    @booking = Booking.new
  end

  # POST /api/bookings
  def create
    @spot = @space.spots.find(params[:spot_id]) # Найти место по spot_id
    @booking = Booking.new(booking_params) # Инициализация с параметрами
    @booking.space = @space # Установка пространства
    @booking.user = current_user # Установка пользователя
    @booking.price = @spot.price # Установка цены
    @booking.status = "pending" # Установка статуса по умолчанию (если это не передаётся)

    puts @booking.save
    if @booking.save
      # Связываем место с бронированием через SpotsBooking
      SpotsBooking.create!(booking: @booking, spot: @spot)
      redirect_to dashboard_path, notice: "Место успешно забронировано!"
    else
      render :new, alert: "Ошибка при создании бронирования."
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
    params.require(:booking).permit(:space_id, :user_id, :start_time, :end_time, :status, :price, :spot)
  end

  def set_space
    @space = Space.find_by(id: params[:space_id])
    unless @space
      redirect_to spaces_path, alert: "Указанное пространство не найдено."
    end
  end
end
