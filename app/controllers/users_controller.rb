# frozen_string_literal: true

class UsersController < ApplicationController

  # GET /new
  def new; end

  # POST /api/register
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )

    if user.save
      session[:user_id] = user.id
      puts "Сессия установлена: #{session[:user_id]}" # Проверяем ID пользователя в сессии
      redirect_to dashboard_path, notice: "Добро пожаловать!", status: :see_other
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  # PUT /api/users/:id/role
  def update_role
    user = User.find(params[:id])
    if user.update(role: params[:role])
      render json: { message: 'Role updated successfully', user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
