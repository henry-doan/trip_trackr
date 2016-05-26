class TripsController < ApplicationController
	before_action :trip, only: [:edit, :show, :update, :destroy]

  def index
  	@trips = Trip.all
  end

  def show
  end

  def edit
  end

  def update
  	if @trip.update(trip_params)
  		redirect_to trip_path(@trip)
  	else
  		#TODO make a flash message
  		render :edit
  	end
  end

  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(trip_params)
  	if @trip.save
  		redirect_to trips_path
  	else
  		#TODO make a flash message
  		render :new
  	end
  end

  def destroy
  	if @trip.destroy
  	redirect_to :trips_path
  	else
  		#flash error message
  		redirect_to :trip_path
  	end
  end

  private

  	def trip
  		@trip = Trip.find(params[:id])
  	end

  	def trip_params
  		params.require(:trip).permit(:name, :info, :date)
  	end
end
