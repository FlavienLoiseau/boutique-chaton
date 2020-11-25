require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  
  def edit
    @address = Address.new
  end

  def update
    @user.update(first_name: params.dig(:user, :first_name), last_name: params.dig(:user, :last_name))
    if @user.address.present?
      ad = Address.update(street_number:params.dig(:user, :address, :street_number), street: params.dig(:user, :address, :street),
                    zip_code:params.dig(:user, :address, :zip_code), city: params.dig(:user, :address, :city), country:params.dig(:user, :address, :country), user_id: @user.id)  
    else
      ad = Address.create(street_number:params.dig(:user, :address, :street_number), street: params.dig(:user, :address, :street),
                    zip_code:params.dig(:user, :address, :zip_code), city: params.dig(:user, :address, :city), country:params.dig(:user, :address, :country), user_id: @user.id)
    end
    redirect_to user_path(@user.id)
    
  end

  def show
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :address)
  end

  def address_params
    params.require(:user).permit(:address[:street_number, :street, :zip_code, :city, :country])
  end

end
