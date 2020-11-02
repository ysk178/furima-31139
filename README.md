# README

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

has_many :items
has_many :records

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| charge      | string     | null: false                    |
| prefecture  | string     | null: false                    |
| days        | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one : record

## recordテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association

belongs_to :user
belongs_to :item
belongs_to :address


## addresses

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| municipality | string     | null: false |
| address      | string     | null: false |
| phone_number | string     | null: false |
| user_id      | references | null: false, foreign_key: true |


### Association

belongs_to :record