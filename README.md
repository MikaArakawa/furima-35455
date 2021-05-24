## users テーブル

| Column                | Type   | Options                    |
| ----------------------| ------ | -----------                |
| email                 | string | null: false,unique: true	  |
| encrypted_password    | string | null: false                |
| nickname              | string | null: false                |
| surname               | string | null: false                |
| first_name            | string | null: false                |
| sei                   | string | null: false                |
| mei                   | string | null: false                |
| birthday              | date   |null: false                 |

### Association

- has_many :items
- has_many :purchased_items

## items テーブル

| Column                   | Type       | Options          |
| -------------------------| ---------- | ---------------- |
| title                    | string     | null: false      |
| description              | text       | null: false      |
| status_id                | integer    | null: false      | 
| category_id              | integer    | null: false      |             
| shipping_charge_id       | integer    | null: false      |            
| shipment_source_id       | integer    | null: false      |             
| shipping_days_id         | integer    | null: false      |             
| user                     | references |foreign_key: true |      

### Association

- belongs_to :user
- has_one_attached :purchased_item

## purchased_items テーブル

| Column                | Type       | Options          |
| --------------------- | ---------- | ---------------- |
| user                  | references |foreign_key: true |    
| item                  | references |foreign_key: true |    

### Association

- belongs_to :user
- belongs_to :item
- has_one_attached :address

## addressesテーブル

| Column          | Type       | Options          |
| --------------- | ---------- | -----------      |
| postal_code     | text       | null: false      |
| prefectures     | text       | null: false      |
| city            | text       | null: false      |
| address1        | text       | null: false      |
| address2        | text       |                  |
| phone           | text       | null: false      |            
| purchased_item  | references |foreign_key: true |        
| user            | references |foreign_key: true |        


### Association
- belongs_to :purchased_item