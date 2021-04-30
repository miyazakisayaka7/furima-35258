class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :set_products, only: [:edit, :update, :destroy]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render :new
      end
  end

  def index
    @products = Product.order("created_at DESC")
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
    redirect_to root_path
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :image, :introduction, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_products
    if current_user.id != @product.user_id || @product.purchase.present?
      redirect_to root_path
    end
  end
end
