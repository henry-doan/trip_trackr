class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:edit, :show, :update, :destroy]

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@location.trip_id, @location)
    else
      #TODO make a flash message
      render :edit
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @location.address = @address
    if @location.address.save
      redirect_to trip_location_path(@location.trip_id, @location)
    else
      #TODO make a flash message
      render :new
    end
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:country, :city)
    end 
end
