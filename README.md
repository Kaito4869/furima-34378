# テーブル設計

## users テーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| family_name        | string  | null: false                |
| first_name         | string  | null: false                |
| family_name_kana   | string  | null: false                |
| first_name_kana    | string  | null: false                |
| nickname           | string  | null: false                |
| encrypted_password | string  | null: false                |
| email              | string  | null: false, unique: :true |
| birth_date         | date    | null: false                |

### Association

- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :purchases dependent: :destroy

## items テーブル

| Column      | Type       | Options           |
| ---------   | ------     | -----------       |
| title       | string     | null: false       |
| description | text       | null: false       |
| category_id | integer    | null: false       |
| state_id    | integer    | null: false       |
| price       | integer    | null: false       |
| fee_id      | integer    | null: false       |
| area_id     | integer    | null: false       |
| date_id     | integer    | null: false       |
| user        | references | foreign_key: true |

### Association

- has_many :comments dependent: :destroy
- belongs_to :user
- has_one :purchase

## comments テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | -----------       |
| zip_code         | string     | null: false       |
| area_id          | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| telephone_number | string     | null: false       |
| purchase         | references | foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル

| Column      | Type       | Options           |
| ---------   | ------     | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address