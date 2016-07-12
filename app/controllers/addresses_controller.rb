class AddressesController < ApplicationController

  before_action :find_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show

  end

  def new
    @address = Address.new
  end

  def edit

  end

  def create
    @address = Address.new(address_params)

    @address.save ? redirect_to(@address) : render(:new)
  end

  def update
    @address.update(address_params) ? redirect_to(@address) : render(:edit)
  end

  def destroy
    if @address.destroy
      redirect_to addresses_path, notice: 'Address successfully destroyed.'
    else
      redirect_to addresses_path, flash: {error: 'Failed to destroy address.'}
    end
  end

  private

  def find_address
    begin
      @address = Address.find(params[:id].to_i)
    rescue
      # what
    end
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :phone_number)
  end
end
