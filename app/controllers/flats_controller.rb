class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    if params[:location].present?
      @flats = @flats.where("address ILIKE ?", "%#{params[:location]}%")
    end

    if params[:capacity].present?
      @flats = @flats.where("capacity >= ?", params[:capacity].to_i)
    end

    #  We can access the session when making a booking.
    # if params[:start_date].present? && params[:end_date].present?
    #   session[:start_date] = params[:start_date]
    #   session[:end_date] = params[:end_date]
    # end
  end

  def new
    @flat = Flat.new
  end

  def show
    # Here we can make use of the sessions[:start_date] && params[:end_date]
    # Or we can make us of the params[:start_date] && params[:end_date]
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    if params[:start_date].present? && params[:end_date].present?
      @booking.start_date = params[:start_date]
      @booking.end_date = params[:end_date]
    end
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :capacity, :picture, :picture_cache, :lat, :long, :price, :description, :title)
  end
end
