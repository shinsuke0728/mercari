class AddressesController < ApplicationController
  before_action :set_address, only: [:new,:create]

  def new
  end

  def create
    @address.update(address_params)
    unless @address.errors.any?
      flash[:notice] = "変更しました"
      redirect_to new_user_address_path
    else
      render :new
    end
  end

  def set_address
     @address = Address.find_or_initialize_by(user_id: current_user.id)
  end


  private
  def address_params
    params.require(:address).
    permit(:first_name, :last_name, :first_name_reading,
           :last_name_reading, :postal_code,
           :city,:block, :prefecture_id).
            merge(user_id: current_user.id)
  end


end
