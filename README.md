## Usersテーブル

|  Column                |  Type       |  Options                  |
| ---------------------- | ----------- | ------------------------- |
| nickname               | string      | null: false               |
| email                  | string      | null: false, unique: true |
| encrypted_password     | string      | null: false               |
| last_name              | string      | null: false               |
| first_name             | string      | null: false               |
| last_name_reading      | string      | null: false               |
| first_name_reading     | string      | null: false               |
| birth_day              | date        | null: false               |

### Association
- has_many :purchases
- has_many :products

## Productsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| name                 | string      | null: false       |
| introduction         | text        | null: false       |
| category_id          | integer     | null: false       |
| condition_id         | integer     | null: false       |
| shopping_charge_id   | integer     | null: false       |
| prefecture_id        | integer     | null: false       |
| day_to_ship_id       | integer     | null: false       |
| selling_price        | integer     | null: false       |
| user                 | references  | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## Purchasesテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| user                 | references  | foreign_key: true |
| product              | references  | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :shipping

## Shippingsテーブル
|  Column              |  Type       |  Options          |
| -------------------- | ----------- | ----------------- |
| postal_code          | string      | null: false       |
| prefecture_id        | integer     | null: false       |
| city                 | string      | null: false       |
| house_number         | string      | null: false       |
| building_name        | string      |                   |
| phone_number         | string      | null: false       |   
| purchase             | references  | foreign_key: true |

### Association
- belongs_to :purchase