class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] do
  end
    
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
    @product =Product.find(params[:id])
    
  end


private

  def product_params
    params.require(:product).permit(:name, :image, :introduction, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id, :selling_price).merge(user_id: current_user.id)
  end
end
