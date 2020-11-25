# テーブル設計

## Usersテーブル

| Column             | Type          | Options                               |
| ------------------ | ------------- | ------------------------------------- |
| nickname           | string        | null: false                           |
| email              | string        | null: false, unique: true, index:true |
| encrypted_password | string        | null: false                           |
| last_name          | string        | null: false                           |
| first_name         | string        | null: false                           |
| last_name_kana     | string        | null: false                           |
| first_name_kana    | string        | null: false                           |
| birth_date         | date          | null: false                           |

### Association

- has_many :items 
- has_many :orders, dependent: :destroy


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
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order, dependent: :destroy


## Ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
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