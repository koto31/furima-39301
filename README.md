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

- has_many :item
- has_many :order

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
| item_price                  | string     | null: false       |
| user                        | references | foreign-key: true |

- belongs_to :user
- belongs_to :order

### ordersテーブル
| Column | Type       | Options           |
| -------| -----------| ----------------- |
| user   | references | foreign-key: true |
| item   | references | foreign-key: true |

- belongs_to :user
- has_one :item
- has_one :share

### sharedテーブル
| Column                      | Type         | Options           |
| --------------------------- | ------------ | ----------------- |
| postal_code                 | string       | null: false       |
| prefecture                  | string       | null: false       |
| city                        | string       | null: false       |
| addresses                   | string       | null: false       |
| phone_number                | string       | null: false       |
| user                        | references   | foreign-key: true |
| item_name                   | string       | null: false       |
| item_price                  | string       | null: false       |
| item_shipping_fee_status_id | integer      | null: false       |

- belongs_to :order