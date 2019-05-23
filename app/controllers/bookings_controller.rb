class BookingsController < ApplicationController
  before_action :flat_id, only: %i[create]

  def index
    @bookings = Booking.all
  end

  # def new
  #   @flat = Flat.find(params[:flat_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(bookings_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.total_price = @flat.price * (@booking.end_date - @booking.start_date).to_i
    raise
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  private

  def flat_id
    @flat = Flat.find(params[:flat_id])
  end


  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
