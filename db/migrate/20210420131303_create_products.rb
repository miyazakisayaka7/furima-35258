class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :name                 , null: false
      t.text        :introduction         , null: false
      t.integer     :category_id          , null: false
      t.integer     :condition_id         , null: false
      t.integer     :shipping_charge_id   , null: false
      t.integer     :prefecture_id        , null: false
      t.integer     :day_to_ship_id       , null: false
      t.integer     :selling_price        , null: false
      t.references  :user                 , foreign_key: true
      t.timestamps
    end
  end
end
