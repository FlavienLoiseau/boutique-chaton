class ProductController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :update]

  def index
    @products = Product.order('created_at ASC')
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.new
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
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end


end


