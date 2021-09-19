# テーブル設計

## usersテーブル

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null:false                |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null:false                |
| family_name_kanji    | string   | null:false                |
| first_name_kanji     | string   | null:false                |
| family_name_katakana | string   | null:false                |
| first_name_katakana  | string   | null:false                |
| birthday             | date     | null:false                |

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| item_name         | string     | null:false                    |
| explanation       | text       | null:false                    |
| category_id       | integer    | null:false                    |
| status_id         | integer    | null:false                    |
| delivery_price_id | integer    | null:false                    |
| prefectures_id    | integer    | null:false                    |
| send_day_id       | integer    | null:false                    |
| price             | integer    | null:false                    |
| user              | references | null:false, foreign_key: true |

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | string     | null:false                    |
| prefectures_id   | integer    | null:false                    |
| municipalities   | string     | null:false                    |
| house_number     | string     | null:false                    |
| building_name    | string     |                               |
| telephone_number | string     | null:false                    |
| order            | references | null:false, foreign_key: true |

- belongs_to :order