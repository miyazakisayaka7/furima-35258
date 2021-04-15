## Usersテーブル

|  Column       |  Type       |  Options     |
| ------------- | ----------- | ------------ |
| nickname      | string      | null: false  |
| name          | string      | null: false  |
| name_reading  | string      | null: false  |
| birthday      | date        | null: false  |

### Association
- has_many :shippings
- belongs_to :purchase


## Productsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| image                | reference   | foreign_key: true |
| product_name         | string      | null: false       |
| product_introduction | text        | null: false       |
| category             | reference   | foreign_key: true |
| condition            | reference   | foreign_key: true |
| shopping_charges     | reference   | foreign_key: true |
| shopping_area        | reference   | foreign_key: true |
| day_to_ship          | reference   | foreign_key: true |
| selling_price        | integer     | null: false       |

### Association
- has_one :users
- belongs_to :purchase

## Purchasesテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| name                 | string      | null: false       |
| product_name         | string      | null: false       |

### Association
- belongs_to :user
- belongs_to :product

## Shippingsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| postal_code          | string      | null: false       |
| prefecture           | integer     | null: false       |
| city                 | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      | null: false       |
| phone_number         | varchar     | null: false       |   

### Association
- belongs_to :user