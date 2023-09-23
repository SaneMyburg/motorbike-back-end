class MotorbikesController < ApplicationController
  def index
    motors = Motorbike.where(user: params[:user_id])
    render json: motors
  end

  def create
    motorbike = Motorbike.new(motorbike_params)
    motorbike.user = User.find(params[:user_id])

    if motorbike.save
      render json: motorbike, status: :created
    else
      render json: motorbike.errors, status: :unprocessable_entity
    end
  end

  def destroy
    motorbike = Motorbike.find_by(id: params[:id], user_id: params[:user_id])
    if motorbike&.destroy
      render json: { message: 'Motorbike deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete motorbike' }, status: :unprocessable_entity
    end
  end

  private

  def motorbike_params
    params.require(:motorbike).permit(:name, :description, :price, :photo)
  end
end
