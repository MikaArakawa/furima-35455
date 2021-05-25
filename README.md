## users テーブル

| Column                | Type   | Options                    |
| ----------------------| ------ | -----------                |
| email                 | string | null: false, unique: true  |
| encrypted_password    | string | null: false                |
| nickname              | string | null: false                |
| surname               | string | null: false                |
| first_name            | string | null: false                |
| sei                   | string | null: false                |
| mei                   | string | null: false                |
| birthday              | date   | null: false                |

### Association

- has_many :items
- has_many :purchased_items

## items テーブル

| Column                   | Type       | Options                       |
| -------------------------| ---------- | ----------------------------- |
| title                    | string     | null: false                   |
| description              | text       | null: false                   |
| price                    | integer    | null: false                   |
| status_id                | integer    | null: false                   | 
| category_id              | integer    | null: false                   |             
| shipping_charge_id       | integer    | null: false                   |            
| prefecture_id            | integer    | null: false                   |
| shipping_date_id         | integer    | null: false                   |             
| user                     | references | null: false, foreign_key: true|      

### Association

- belongs_to :user
- has_one :purchased_item

## purchased_items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |    
| item                  | references | null: false, foreign_key: true |    

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -----------                    |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone           | string     | null: false                    |            
| purchased_item  | references | null: false, foreign_key: true |        

### Association
- belongs_to :purchased_item