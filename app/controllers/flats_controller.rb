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


  # def dashboard
  #   @my_flats = current_user.flats
  #   @my_outgoing_bookings = current_user.bookings
  #   @my_incoming_bookings = current_user.received_bookings
  # end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      current_user.update!(owner: true)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    if current_user != @flat.user
      redirect_to flats_path
      flash[:warning] = "Get out of here !"
    else
      @flat.destroy
      redirect_to flats_path
      # might be nice to redirect somewhere more usefull.
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    if current_user != @flat.user
      redirect_to flats_path
      flash[:warning] = "Get out of here !"
    end
    # rails will render a templaye with the same name as the action
    # located in a folder with the same name as the controller
    # -> flats/edit.html.erb
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :capacity, :picture, :picture_cache, :lat, :long, :price, :description, :title)
  end
end
