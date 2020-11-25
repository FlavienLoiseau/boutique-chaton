class ProductsController < ApplicationController
  require 'mini_magick'
  before_action :set_product, only: [:show, :destroy, :update]
  before_action :is_admin, only: [:create, :destroy, :update]

  def index
    @products = Product.order('created_at ASC')
  end

  def show
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

  def update
    mini_image = MiniMagick::Image.new(params[:image].tempfile.path)
    mini_image.resize '900x600'
    @event.cover.attach(params[:image])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def is_admin
    unless current_user.is_admin == true
      redirect_to root_path
    end
  end

end
