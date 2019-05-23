class BookingsController < ApplicationController
  before_action :flat_id, only: %i[create]

  def index
     @bookings = Booking.all
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.total_price = @flat.price * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:commit] == "accepted"
      @booking.status = "accepted"
    elsif params[:commit] == "rejected"
      @booking.status = "rejected"
    end
    @booking.save
    redirect_to host_bookings_path(current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  def host
    @bookings = current_user.host_bookings
  end

  def guest
    @bookings = current_user.bookings
  end

  private

  def flat_id
    @flat = Flat.find(params[:flat_id])
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
