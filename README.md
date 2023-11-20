## users table

|Column            |Type  |Options                |
|------------------|------|-----------------------|
|nickname          |string|null:false             |
|email             |string|null:false, unique:true|
|encrypted_password|string|null:false             |
|last_name         |string|null:false             |
|first_name        |string|null:false             |
|last_name_kana    |string|null:false             |
|first_name_kana   |string|null:false             |
|birth_date        |date  |null:false             |

### Association
- has_many :items
- has_many :purchase_records



## items table

|Column             |Type      |Options                     |
|-------------------|----------|----------------------------|
|name               |string    |null:false                  |
|explanation        |text      |null:false                  |
|category_id        |integer   |null:false                  |
|status_id          |integer   |null:false                  |
|delivery_cost_id   |integer   |null:false                  |
|region_id          |integer   |null:false                  |
|delivery_day_id    |integer   |null:false                  |
|price              |integer   |null:false                  |
|user               |references|null:false, foreign_key:true|

### Association
- belongs_to :user
- has_one :purchase_record



## addresses table

|Column           |Type       |Options                     |
|-----------------|-----------|----------------------------|
|post_code        |integer    |null:false                  |
|region_id        |integer    |null:false                  |
|city             |string     |null:false                  |
|street_address   |string     |null:false                  |
|building         |string     |                            |
|phone_number     |string     |null:false                  |
|purchase_record  |references |null:false, foreign_key:true|

### Association
- belongs_to :purchase_record


## purchase_records table

|Column           |Type           |Options                     |
|-----------------|---------------|----------------------------|
|user             |references     |null:false, foreign_key:true|
|item             |references     |null:false, foreign_key:true|



### Association
- belongs_to :user
- belongs_to :item
- has_one :address