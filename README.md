## users table

|Column         |Type  |Options                |
|---------------|------|-----------------------|
|nickname       |string|null:false             |
|email          |string|null:false, unique:true|
|password       |string|null:false             |
|last_name      |string|null:false             |
|first_name     |string|null:false             |
|last_name_kana |string|null:false             |
|first_name_kana|string|null:false             |
|birth_date     |date  |null:false             |

### Association
- has_many :item
- has_many :purchase_records
- has_one :addresses



## items table

|Column             |Type      |Options                     |
|-------------------|----------|----------------------------|
|name               |string    |null:false                  |
|explanation        |string    |null:false                  |
|category           |integer   |null:false                  |
|status             |integer   |null:false                  |
|delivery_cost      |integer   |null:false                  |
|region             |integer   |null:false                  |
|days               |integer   |null:false                  |
|price              |integer   |null:false                  |
|user               |references|null:false, foreign_key:true|

### Association
- belongs_to :user
- has_one :purchase_record



## addresses table

|Column           |Type       |Options                     |
|-----------------|-----------|----------------------------|
|post_code        |integer    |null:false                  |
|prefecture       |integer    |null:false                  |
|city             |string     |null:false                  |
|street_address   |string     |null:false                  |
|building         |string     |null:false                  |
|phone_number     |integer    |null:false                  |
|user             |references |null:false, foreign_key:true|

### Association
- belongs_to :user



## purchase_records table

|Column           |Type           |Options                     |
|-----------------|---------------|----------------------------|
|user             |references     |null:false, foreign_key:true|
|item             |references     |null:false, foreign_key:true|



### Association
- belongs_to :user
- belongs_to :item