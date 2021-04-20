class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :shopping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :selling_price
    validates :user
  end
  has_one_attached :image
end