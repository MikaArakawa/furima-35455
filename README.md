## users テーブル

| Column      | Type   | Options                    |
| ----------- | ------ | -----------                |
| email       | text   | null: false,unique: true	  |
| password    | text   | null: false                |
| nickname    | text   | null: false                |
| surname     | text   | null: false                |
| first_name  | text   | null: false                |
| sei         | text   | null: false                |
| mei         | text   | null: false                |
| birthday    | text   | null: false                |


## items テーブル

| Column                   | Type       | Options          |
| -------------------------| ---------- | ---------------- |
<!-- | seller                   | text       | null: false      | -->
| title                    | text       | null: false      |
| description              | string     | null: false      |
| status                   | text       | null: false      | 
| category                 | text       | null: false      |             
| shipping_charges         | text       | null: false      |            
| shipment_source          | text       | null: false      |             
| estimated_shipping_date  | text       | null: false      |             
| image                    | references | null: false      |    
| users                    | references |foreign_key: true |      
| purchased_items          | references |foreign_key: true |        



## purchased_items テーブル

| Column                | Type       | Options          |
| --------------------- | ---------- | ---------------- |
<!-- | buyer                 | text       | null: false      | -->
| purchased_item        | text       | null: false      |            
|users                  | references |foreign_key: true |    
|items                  | references |foreign_key: true |    

## addressesテーブル

| Column          | Type       | Options          |
| --------------- | ---------- | -----------      |
| postal_code     | text       | null: false      |
| prefectures     | text       | null: false      |
| city            | text       | null: false      |
| address1        | text       | null: false      |
| address2        | text       |                  |
| phone           | text       | null: false      |            
| purchased_items | references |foreign_key: true |        


## Association
users has_many items
users has_many purchased_items

items belongs_to users
items has_one_attached purchased_items

purchased_items belongs_to users
purchased_items belongs_to items
purchased_items has_one_attached addresses

addresses belongs_to purchased_items