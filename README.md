# README
# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           |   string   | null: false |
| first_name         |   string   | null: false |
| last_name          |   string   | null: false |
| email              |   string   | null: false |
| encrypted_password |   string   | null: false |
| birthday           |    data    | null: false |
| user_id            | references | null: false |
| profile            |   string   | null: false |

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

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| price            |   string   | null: false |
| item_title       | references | null: false |
| item_description |    text    | null: false |
| user_id          | references | null: false |

### Association

- belongs_to :user
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :comments

- has_one :order
- has_one :ordercomment

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  |    text    | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     |                                |
| state       | string     | null: false, foreign_key: true |
| city        | string     | null: false, foreign_key: true |
| street      | string     | null: false, foreign_key: true |
| building    | string     | null: false, foreign_key: true |
| phone       | string     | null: false, foreign_key: true |
| first_name  | string     | null: false, foreign_key: true |
| last_name   | string     | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## ordercomments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  |    text    | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## user_transactions テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| transactions_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction
- belongs_to :user

## transactions テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| review    | string     | null: false, foreign_key: true |
| confirm   | references | null: false, foreign_key: true |
| comment   | string     | null: false, foreign_key: true |
| seller_id | references | null: false, foreign_key: true |
| buyer_id  | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :item
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
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
