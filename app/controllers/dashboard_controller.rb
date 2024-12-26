class DashboardController < ApplicationController
  before_action :require_login

  def index
    # Здесь можно загрузить данные для отображения
    @user = current_user
    @bookings = @user.bookings
    @spaces = Space.where(creator_id: @user.id)
  end
end
