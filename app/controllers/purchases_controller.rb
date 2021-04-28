class PurchasesController < ApplicationController
  
  def index
    @purchase = Purchase.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_shipping =PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      Payjp.api_key = "sk_test_fe283a245b6881fd47ba0eff"
      Payjp::Charge.create(
        amount: @product.selling_price,
        card: purchase_shipping_params[:token],
        currency: 'jpy'
      )
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_shipping_params
    params.permit(:postal_code, :prefecture_id, :building_name, :city, :house_number, :phone_number, :product_id, :user_id, :token).merge(user_id: current_user.id)
  end
end
