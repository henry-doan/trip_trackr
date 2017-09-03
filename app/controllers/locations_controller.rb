class LocationsController < ApplicationController
  before_action :location, only: [:edit, :show, :update, :destroy]
  before_action :trip, only: [:index, :show, :new, :create]
  def index
    @locations = Location.all
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      #TODO make a flash message
      render :edit
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to trip_location_path(@trip, @location)
    else
      #TODO make a flash message
      render :new
    end
  end

  def destroy
    if @location.destroy
      redirect_to locations_path
    else
      #flash error message
      redirect_to locations_path
    end
  end

  private
    def trip
      @trip = Trip.find(params[:trip_id])
    end

    def location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:place, :trip_id)
    end
end
