class FlatsController < ApplicationController
  def index
    @flats = Flat.all
    # if params[:location]
    #   @flats = Flat.where("address ILIKE ?" , "#{params[:location]}" )

    # end
    # if params[:capacity] != ""
    # #   @flats = @flats.where(capacity: params[:capacity])
    # end
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
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
