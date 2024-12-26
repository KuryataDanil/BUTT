# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.password == params[:password] # Или user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Сессия установлена: #{session[:user_id]}" # Проверяем ID пользователя в сессии
      redirect_to dashboard_path, notice: "Добро пожаловать!", status: :see_other
    else
      puts "Аутентификация не удалась. Пользователь: #{user.inspect}, пароль: #{params[:password]}"
      flash.now[:alert] = "Неверный email или пароль"
      redirect_to login_path, notice: "Добро пожаловать!", status: :ok
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end

