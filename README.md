## Usersテーブル

|  Column                |  Type       |  Options     |
| ---------------------- | ----------- | ------------ |
| nickname               | string      | null: false  |
| email                  | string      | null: false  |
| pass_word              | string      | null: false  |
| pass_word_confirmation | string      | null: false  |
| name                   | string      | null: false  |
| name_reading           | string      | null: false  |
| birthday               | date        | null: false  |

### Association
- has_many :purchases
- has_many :products

## Productsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| product_name         | string      | null: false       |
| product_introduction | text        | null: false       |
| category             | integer     | null: false       |
| condition            | integer     | null: false       |
| shopping_charges     | integer     | null: false       |
| shopping_area        | integer     | null: false       |
| day_to_ship          | integer     | null: false       |
| selling_price        | integer     | null: false       |

### Association
- has_one :users
- belongs_to :purchase

## Purchasesテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| user                 | references  | null: false       |
| item                 | references  | null: false       |

### Association
- belongs_to :user
- belongs_to :product

## Shippingsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| postal_code          | string      | null: false       |
| prefecture_id        | integer     | null: false       |
| city                 | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      |                   |
| phone_number         | string      | null: false       |   
| purchase             | references  | foreign_key       |

### Association
- belongs_to :purchase