class BookingsController < ApplicationController
  # before_action :get_flat, :get_user

  # def index
  #   @bookings = Booking.all
  # end

  # def new
  #   @booking = Booking.new
  # end

  # def create
  #   @booking = Booking.new(bookings_params)
  #   @booking.flat = @flat
  #   @booking.user = current_user
  #     if @booking.save
  #       redirect_to booking_path(@booking)
  #     else
  #       render :new
  #     end
  # end

  # def show

  # end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to bookings_path(@booking)
  # end

  # private

  # def get_flat
  #   @flat = Flat.find(params[:flat_id])
  # end

  # def get_user
  #   @user = User.find(params[:user_id])
  # end

  # def bookings_params
  #   params.require(:booking).permit(:start_date, :end_date, :total_price)
  # end
end
