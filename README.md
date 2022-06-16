# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| name                  | string              | null: false               |
| email                 | string              | null: false,unique:true   |
| encrypted_password    | string              | null: false               |
| family_name           | string              | null: false               |
| first_name            | string              | null: false               |
| family_name_kana      | string              | null: false               |
| family_first_name_kana| string              | null: false               |
| birthday              | string              | null: false               |


### Association

* has_many :items
* has_many :purchase_records


## items table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| price            | integer    | null: false                    |
| explain          | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
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
| shipping_area_id | integer    | null: false                    |
| city_name        | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false,                   |

### Association


