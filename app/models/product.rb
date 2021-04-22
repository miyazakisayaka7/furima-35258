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
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :selling_price
    validates :user
  end
  
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :day_to_ship_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
end