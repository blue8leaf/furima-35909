# テーブル設計

## usersテーブル

| Column     | Type   | Options    |
| ---------- | ------ |            |
| nickname   | string | null:false |
| email      | string | null:false |
| password   | string | null:false |
| kanji      | string | null:false |
| katakana   | string | null:false |
| birthday   | string | null:false |

- has_many :items
- has_many :orders

## itemsテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item_name   | string     | null:false                    |
| explanation | text       | null:false                    |
| price       | integer    | null:false                    |
| user        | references | null:false, foreign_key: true |

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

- belongs_to :user
- has_one :item
- has_one :send

## sendsテーブル

| Column           | Type    | Options    |
| ---------------- | ------- | ---------- |
| postal_code      | integer | null:false |
| municipalities   | string  | null:false |
| address          | string  | null:false |
| building_name    | string  | null:false |
| telephone_number | integer | null:false |

- has_one :order