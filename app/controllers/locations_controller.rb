class LocationsController < ApplicationController
	before_action :location, only: [:edit, :show, :update, :destroy]
  def index
    @trip = Trip.find(params[:trip_id])
    @locations = Location.where(trip_id: @trip)
  end

  def show
    @trip = Trip.find(params[:trip_id])
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
    @trip = Trip.find(params[:trip_id])
    @location = Location.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
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
      redirect_to :locations_path
    else
      #flash error message
      redirect_to :location_path
    end
  end

  private

    def location
      @location = Location.find(params[:trip_id])
    end

    def location_params
      params.require(:location).permit(:place, :trip_id)
    end 
end
