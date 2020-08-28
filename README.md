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

# テーブル設計

## usersテーブル

|  column                         | Type            | Options           |
| ---------------------- | ---------- | --------------- |
| nickname                       | string         | null: false         |
| email                              | string          | null: false         |
| password                       | string          | null: false         |
| family_name                  | string          | null: false         |
| first_name                      | string          | null: false          |
| family_name_kana         | string          | null: false          |
| first_name_kana            | string          | null: false          |
| birthday                         | date          | null: false          |

### Association

- has_many :items
- has_many :purchase


## itemsテーブル

|  column  | Type         | Options         |
| ------------------ | ----------   | --------------- |
| user_id                   | references   | null: false, foreign_key: true  |
| name                       | string          | null: false          |
| price                         | string          | null: false          |
| explanation              | string         |                            |


### Association

- 
- belongs_to :users

## purchaseテーブル

|  column       | Type              | Options                                    |
| ----------- | ------------- | ---------------------------- |
| user_id         | references    | null: false, foreign_key: true  |
| item_id         | references    | null: false, foreign_key: true  |


### Association

- belongs_to :users
- belongs_to :items
- has_one :delivery

## deliveryテーブル

|  column                | Type           | Options             |
| ----------------- | ---------- | --------------- |
| postal_code         | string         | null: false          |
| prefecture            | string          | null: false          |
| municipalities      | string          | null: false          |
| address                | string          | null: false          |
| building                | string          |                           |
| phone_number    | string          | null: false          |

### Association

- belongs_to :purchase