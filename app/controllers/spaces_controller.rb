# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update]
  before_action :authorize_creator, only: [:edit, :update]

  # Метод для отображения пространства
  def show
    # @space уже загружен с помощью before_action
  end

  # Метод для редактирования пространства
  def edit
    # @space уже загружен с помощью before_action
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
      redirect_to dashboard_path, notice: "Добро пожаловать!", status: :ok
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
