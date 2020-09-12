class AddressesController < ApplicationController
  # before_action :set_address, only: [:show, :edit, update, :destroy]
  
  def index
    @location = Location.address(params[:location_id])
    @addresses = Location.addresses
  end

  def show
    @location = Location.find(params[:location_id])
    @address = @location.addresses.find(params[:id])
  end

  def new
    @location = Location.find(params[:location_id])
    @address = @location.addresses.new
    render partial: "form"
  end

  def create
    @location = Location.find(params[:location_id])
    @address = @location.addresses.new(address_params)
    
    if @address.save
      redirect_to addresses_path(@addresses)
    else 
      render partial: "form"
    end
  end

  def edit
    @location = Location.find(params[:location_id])
    @address = @location.addresses.find(params[:id])
git 
    render partial: "form"
  end

  def update
    @location = Location.find(params[:sub_id])
    @address = @location.addresses.find(params[:id])

    if (@address.update(address_params))
      redirect_to location_path(@location)
    else
      render partial: "form"
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    address = @location.addresses.find(params[:id])
    address.destroy
    redirect_to location_path(@location)
  end
  
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :state, :zip)
  end

end
