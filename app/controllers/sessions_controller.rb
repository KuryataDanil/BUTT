# frozen_string_literal: true

class SessionsController < ApplicationController
  # POST /api/login
  def create
    user = User.find_by(email: params[:email])
    if user&.password == params[:password] # Пример простой проверки
      render json: { message: 'Login successful', user: user }, status: :ok
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end
end