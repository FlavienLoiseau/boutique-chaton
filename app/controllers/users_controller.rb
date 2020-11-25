class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  
  def edit
    
  end

  def update
    @user.update(user_params)
    @user.address.update(street_number: params[:street_number], street: params[:street], zip_code: params[:zip_code], city: params[:city], country: params[:country], user_id: current_user.id)
  
    redirect_to user_path(@user.id)
    
  end

  def show
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

  def address_params
    params.require(:user).permit(:street_number, :street, :zip_code, :city, :country, :id)
  end

end
