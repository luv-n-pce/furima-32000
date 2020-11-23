# テーブル設計

## Users名

| Column             | Type          | Options                               |
| ------------------ | ------------- | ------------------------------------- |
| nickname           | string        | null: false                           |
| email              | string        | null: false, unique: true, index:true |
| encrypted_password | string        | null: false                           |
| family_name        | string        | null: false                           |
| first_name         | string        | null: false                           |
| family_name_kana   | string        | null: false                           |
| first_name_kana    | string        | null: false                           |
| birthday           | date          | null: false                           |

### Association

- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_many :orders, dependent: :destroy
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash :birth_day


## Items名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_img        | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | references | null: false, foreign_key: true |
| item_condition  | references | null: false, foreign_key: true |
| postage_payer   | references | null: false, foreign_key: true |
| prefecture_code | references | null: false, foreign_key: true |
| preparation_day | references | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| seller          | references | null: false, foreign_key: true |

### Association
- has_many :item_imgs, dependent: :destroy
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture_code
- belongs_to_active_hash :preparation_day
- belongs_to :seller, class_name: "User"
- has_one :order, dependent: :destroy


## Orders名

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :buyer, class_name: "User"
- belongs_to :item
- has_one :sending_destination, dependent: :destroy


## Sending_destination名

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture_code | references | null: false, foreign_key: true |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false, unique: true      |
| order           | references | null: false, foreign_key: true |


### Association
- belongs_to :order
- belongs_to_active_hash :prefecture_code