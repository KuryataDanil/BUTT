# frozen_string_literal: true

class Api::ObjectsController < ApplicationController
  # GET /api/spaces/:space_id/objects
  def index
    space = Space.find(params[:space_id])
    render json: space.objects, status: :ok
  end

  # POST /api/spaces/:space_id/objects
  def create
    object = SpaceObject.new(space_object_params)
    object.space_id = params[:space_id]
    if object.save
      render json: { message: 'Object created successfully', object: object }, status: :created
    else
      render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /api/objects/delete (bulk delete)
  def bulk_delete
    SpaceObject.where(id: params[:ids]).destroy_all
    render json: { message: 'Objects deleted successfully' }, status: :ok
  end

  private

  def space_object_params
    params.require(:space_object).permit(:x, :y, :size_x, :size_y, :angle)
  end
end
