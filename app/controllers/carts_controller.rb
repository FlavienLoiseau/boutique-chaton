class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :is_my_cart]
  before_action :is_my_cart, only: [:show, :create, :update]

  def show

  end

  def create
    @cart = Cart.new
    @cart.user = current_user
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end

  def is_my_cart
    unless current_user == @cart.user
      redirect_to current_user.carts.last
    end
  end
end
