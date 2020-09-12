class LocationsController < ApplicationController
 before_action :set_location, only: [:show, :edit, :update, :destroy]
 before_action :find_trip

  def index
    @trip = Trip.location(params[:trip_id])
    @locations = Trip.locations
    # @locations = @location_trip.locations
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @location = @trip.locations.new
    # @location = @location_trip.locations.new
    render partial: "form" ##form for locations
  end

  def create
    @location = @location_trip.locations.new(location_params)
  
    if @location.save
      redirect_to trip_locations_path
    else
      render :new
    end
  
  end



  def edit
   render partial: "form"
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path(@location)
    else
      render :edit
    end

  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path

  end

 


  private

  def location_params
params.require(:location).permit(:name, :trip_id)
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def find_trip
    @location_trip = current_user.trips.find(params[:trip_id])
  end


end
