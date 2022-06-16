# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| name                  | string              | null: false               |
| email                 | string              | null: false               |
| encrypted_password    | string              | null: false               |
| family_name           | string              | null: false               |
| first_name            | string              | null: false               |
| family_name_kana      | string              | null: false               |
| family_first_name_kana| string              | null: false               |
| birthday              | string              | null: false               |


### Association

* has_many :items
* has_many :purchase_records
* has_one  :addresses

## items table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| postage          | string     | null: false                    |
| price            | string     | null: false                    |
| explain          | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| delivery_days    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| address          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
* has_one    :purchase_record

## purchase_records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| address     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address

## addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_cord        | string     | null: false                    |
| prefectures_code | string     | null: false                    |
| city_name        | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     | null: false  foreign_key: true |
| phone_number     | string     | null: false, foreign_key: true |

### Association

* has_many :items
* has_many :purchase_records
- belongs_to :user
