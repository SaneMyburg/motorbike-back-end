class ReservationsController < ApplicationController
  def index
    reservation = Reservation.where(user: params[:user_id], motorbike: params[:motorbike_id])

    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user = User.find(params[:user_id])
    reservation.motorbike = Motorbike.find(params[:motorbike_id])

    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id], user_id: params[:user_id], motorbike_id: params[:motorbike_id])

    if reservation&.destroy
      render json: { message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :city)
  end
end
