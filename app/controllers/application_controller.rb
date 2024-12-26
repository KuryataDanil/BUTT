class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token, if: -> { Rails.env.test? }

  helper_method :current_user, :logged_in?

  # Проверка, есть ли текущий пользователь
  def logged_in?
    !!current_user # Вернет true, если current_user существует, иначе false
  end

  # Метод для получения текущего пользователя
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    puts "Проверка авторизации. Сессия: #{session[:user_id]}" # Смотрим, что находится в сессии

    unless logged_in?
      redirect_to login_path, alert: "Вы должны войти в систему, чтобы получить доступ к этой странице."
    end
  end
end
