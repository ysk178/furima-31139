# README

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana               | string  | null: false |
| birthday           | integer | null: false |

### Association

has_many :items
has_many :records

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one : record

## recordテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code_id | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| record         | references | null: false, foreign_key: true |

### Association

belongs_to :record