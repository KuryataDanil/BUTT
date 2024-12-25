# frozen_string_literal: true

class SpacesController < ApplicationController
  # GET /api/spaces
  def index
    spaces = Space.all
    render json: spaces, status: :ok
  end

  # POST /api/spaces
  def create
    space = Space.new(space_params)
    if space.save
      render json: { message: 'Space created successfully', space: space }, status: :created
    else
      render json: { errors: space.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/spaces/:id
  def update
    space = Space.find(params[:id])
    if space.update(space_params)
      render json: { message: 'Space updated successfully', space: space }, status: :ok
    else
      render json: { errors: space.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/spaces/:id
  def destroy
    space = Space.find(params[:id])
    space.destroy
    render json: { message: 'Space deleted successfully' }, status: :ok
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :opening_time, :closing_time, :creator_id)
  end
end
