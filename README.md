# テーブル設計

## Usersテーブル

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


## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| seller             | references | null: false, foreign_key: true |

### Association
- belongs_to :seller, class_name: "User"
- has_one :order, dependent: :destroy


## Ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :buyer, class_name: "User"
- belongs_to :item
- has_one :sending_destination, dependent: :destroy


## Sending_destinationテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false, unique: true      |
| order              | references | null: false, foreign_key: true |


### Association
- belongs_to :order