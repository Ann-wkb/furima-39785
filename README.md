# README
# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           |   string   | null: false |
| first_name         |   string   | null: false |
| last_name          |   string   | null: false |
| first_name_kana    |   string   | null: false |
| last_name_kana     |   string   | null: false |
| email              |   unique   | null: false |
| encrypted_password |   string   | null: false |
| birthday           |    data    | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :items
- has_many :orders, foreign_key: 'buyer_id'
- has_many :selling_items, class_name: 'Item', foreign_key: 'seller_id'
- has_many :ordercomments
- has_many :user_transactions
- has_many :transactions, through: :user_transactions
- has_many :comments


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| price            |   integer  | null: false |
| item_title       | references | null: false |
| item_description |    text    | null: false |
| user             | references | null: false |
| category         | references | null: false |
| condition        | references | null: false |
| shipping_cost    | references | null: false |
| shipping_place   | references | null: false |
| shipping_date    | references | null: false |

### Association

- belongs_to :user
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :comments
- has_one :order
- has_one :ordercomment


## brands_categories テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| brand_id         | references | null: false |
| category_id      | references | null: false |

### Association

- belongs_to :user
- has_many :room_users


## categories テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | references | null: false |

### Association

- belongs_to :user
- has_many :room_users


## brands テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | references | null: false |

### Association

- belongs_to :user
- has_many :room_users


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  |    text    | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## addresses テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| state       | string     | null: false |
| city        | string     | null: false |
| street      | string     | null: false |
| building    | string     | null: false |
| phone       | string     | null: false |
| first_name  | string     | null: false |
| last_name   | string     | null: false |
| user        | references | null: false |


### Association

- belongs_to :user

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| card      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to :card
- belongs_to :address


## cards テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| card     | references | null: false, foreign_key: true |

### Association

- belongs_to :card
- belongs_to :user

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
