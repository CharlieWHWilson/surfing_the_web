class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
   @booking = Booking.find(params[:id])
  end

  def new
    @surfboard = Surfboard.find(params[:surfboard_id])
    @user = current_user
    @booking = Booking.new
  end

  def create
    @surfboard = Surfboard.find(params[:surfboard_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.surfboard = @surfboard
    @booking.user = @user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
