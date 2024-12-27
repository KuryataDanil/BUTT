# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update]

  def edit
    # @space уже установлен в set_space\
    @space_id = @space.id
  end


  # Метод для отображения пространства
  def show
    @spots = @space.spots # Загружаем все места, связанные с этим пространством
  end

  def index
    @spaces = Space.all # Или добавьте фильтры, если нужно
    render json: @spaces, status: :ok
  end

  # POST /spaces
  def create
    space = Space.new(space_params)
    space.creator_id = current_user.id
    if space.save
      redirect_to dashboard_path, notice: "Добро пожаловать!", status: :see_other
    else
      render json: { errors: space.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # PUT /spaces/:id
  def update
    space = Space.find(params[:id])
    if space.update(space_params)
      redirect_to dashboard_path, notice: "Добро пожаловать!"#, status: :ok
    else
      render json: { errors: space.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /spaces/:id
  def destroy
    space = Space.find(params[:id])
    space.destroy
    render json: { message: 'Space deleted successfully' }, status: :ok
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def authorize_creator
    unless @space.creator_id == current_user.id
      redirect_to space_path(@space), alert: "У вас нет прав для редактирования этого пространства."
    end
  end

  def space_params
    params.require(:space).permit(:name, :description, :opening_time, :closing_time)
  end
end
