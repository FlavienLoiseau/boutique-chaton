class ProductsController < ApplicationController
  require 'mini_magick'
  before_action :set_product, only: [:show, :destroy, :update]

  def index
    @products = Product.order('created_at ASC')
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.new
    mini_image = MiniMagick::Image.new(params[:image].tempfile.path)
    mini_image.resize '900x600'
    @event.cover.attach(params[:image])
    if @product.save
      flash[:success] = "Votre produit a bien été créé !"
      redirect_to root
    else
      render 'new'
    end

  end

  def show

  end

  def destroy
    @product.destroy
    redirect_to '/'
  end

  def update
    mini_image = MiniMagick::Image.new(params[:image].tempfile.path)
    mini_image.resize '900x600'
    @event.cover.attach(params[:image])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end


end
