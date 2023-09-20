# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### usersテーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_date            | date   | null: false               |

- has_many :items
- has_many :orders

### itemsテーブル
| Column                      | Type       | Options           |
| --------------------------- | ---------- | ------------------|
| item_name                   | string     | null: false       |
| item_info                   | text       | null: false       |
| item_category_id            | integer    | null: false       |
| item_sales_status_id        | integer    | null: false       |
| item_shipping_fee_status_id | integer    | null: false       |
| item_prefecture_id          | integer    | null: false       |
| item_scheduled_delivery_id  | integer    | null: false       |
| item_price                  | integer    | null: false       |
| user                        | references | foreign_key: true |

- belongs_to :user
- has_many :orders

### ordersテーブル
| Column | Type       | Options                        |
| -------| -----------| ------------------------------ |
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |

- belongs_to :user
- belongs_to :item
- has_one :shared

### sharedテーブル
| Column                      | Type         | Options           |
| --------------------------- | ------------ | ----------------- |
| postal_code                 | string       | null: false       |
| item_prefecture_id          | integer      | null: false       |
| city                        | string       | null: false       |
| addresses                   | string       | null: false       |
| building                    | string       |                   |
| phone_number                | string       | null: false       |
| orders                      | references   | foreign_key: true |



- belongs_to :order