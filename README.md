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

| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password-confirmation | string | null: false               |
| last-name             | string | null: false               |
| first-name            | string | null: false               |
| last-name-kana        | string | null: false               |
| first-name-kana       | string | null: false               |
| birth-date            | date   | null: false               |

- has_many :items
- has_many :orders

| Column                   | Type       | Options           |
| ------------------------ | ---------- | ------------------|
| item-name                | string     | null: false       |
| item-info                | text       | null: false       |
| item-category            | string     | null: false       |
| item-sales-status        | string     | null: false       |
| item-shipping-fee-status | string     | null: false       |
| item-prefecture          | string     | null: false       |
| item-scheduled-delivery  | string     | null: false       |
| item-price               | string     | null: false       |
| user_id                  | references | foreign-key: true |

- belongs_to :users
- belongs_to :orders

| Column   | Type       | Options           |
| -------- | -----------| ----------------- |
| order_id | references | foreign-key: true |
| item_id  | references | foreign-key: true |

- belongs_to :users
- has_one :items
- has_one :shared

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postal-code  | string | null: false |
| prefecture   | string | null: false |
| city         | string | null: false |
| addresses    | string | null: false |
| phone-number | string | null: false |

- belongs_to :orders