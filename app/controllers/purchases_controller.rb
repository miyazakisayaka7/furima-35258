class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def index
    @purchase_shipping = PurchaseShipping.new
      if @product.purchase.present?
        redirect_to root_path
      end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
      if @purchase_shipping.valid?
        card_pay
        @purchase_shipping.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :building_name, :city, :house_number, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
    if current_user.id == @product.user_id
      redirect_to root_path
    end
  end
  
  def card_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @product.selling_price,
          card: purchase_params[:token],
          currency: 'jpy'
        )
  end
  
end
