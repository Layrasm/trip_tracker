class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  
  def index
    @location = Location.find(params[:location_id])
    @addresses = @location.addresses
  end

  def show
    # @location = Location.find(params[:location_id])
    # @address = @location.addresses.find(params[:id])
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
      redirect_to location_addresses_path
    else 
      render :new
    end
  end

  def edit
    # @location = Location.find(params[:location_id])
    # @address = @location.addresses.find(params[:id])

    render partial: "form"
  end

  def update
    # @location = Location.find(params[:sub_id])
    # @address = @location.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to location_path(@location)
    else
      render partial :edit
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    address = @location.addresses.find(params[:id])
    address.destroy
    redirect_to location_path(@location)
  end
  
 

  private

  def address_params
    params.require(:address).permit(:address, :city, :state, :zip)
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
