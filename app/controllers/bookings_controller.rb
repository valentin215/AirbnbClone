class BookingsController < ApplicationController
  before_action :flat_id, only: %i[create]

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
    @booking.update(bookings_params)
    redirect_to host_bookings_path(current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # DESTROY WITH AJAX
    respond_to do |format|
      format.html { redirect_to bookings_path(@booking) }
      format.js
    end
  end

  def host
    @bookings = current_user.host_bookings
    @flats = current_user.flats
  end

  def guest
    @bookings = current_user.bookings
  end

  private

  def flat_id
    @flat = Flat.find(params[:flat_id])
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end
end
