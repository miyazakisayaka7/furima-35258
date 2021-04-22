class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day_to_ship
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :selling_price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :day_to_ship_id
    validates :prefecture_id
    validates :shipping_charge_id
  end
    validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999 }
    validates :selling_price,format: { with: /\A[0-9]+\z/ }
end