class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    reservations = user.reservations
    render json: { user:, reservations: }
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user&.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(name: user_params[:name])

    if user
      render json: user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
