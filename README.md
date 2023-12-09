# README
# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           |   string   | null: false               |
| first_name         |   string   | null: false               |
| last_name          |   string   | null: false               |
| first_name_kana    |   string   | null: false               |
| last_name_kana     |   string   | null: false               |
| email              |   string   | null: false, unique: true |
| encrypted_password |   string   | null: false               |
| birthday           |    data    | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments


## items テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| price             |   string   | null: false |
| item_title        | references | null: false |
| item_description  |    text    | null: false |
| user              | references | null: false |
| category_id       | integer    | null: false |
| condition_id      | integer    | null: false |
| shipping_cost_id  | integer    | null: false |
| shipping_place_id | integer    | null: false |
| shipping_date_id  | integer    | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :order


## addresses テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| street      | string     | null: false |
| building    | string     |             |
| phone       | string     | null: false |


### Association

- belongs_to :orders


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :card
- belongs_to :address


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
