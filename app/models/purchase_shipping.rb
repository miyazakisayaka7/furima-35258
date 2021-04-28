class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :phone_number, :user_id, :product_id, :building_name, :token
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end