class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {surfboard: surfboard})
      }
    end
  end

  def show
    @surfboard = Surfboard.find(params[:id])
    @booking = Booking.new
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = current_user
    if @surfboard.save
      redirect_to surfboard_path(@surfboard)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @surfboard = Surfboard.find(params[:id])
    @surfboard.destroy
    redirect_to surfboards_path, status: :see_other
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:board_type, :description, :availibility, :location, :price, photos: []).tap do |whitelisted|
      whitelisted[:price] = whitelisted[:price].to_i
    end
  end
end
