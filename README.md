# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
- has_many :products, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_image|string|null: false|
|name|string|null: false|
|introduction|text|null: false|
category_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|shipping_fee_payer_id|references|null: false, foreign_key: true|
|shipping_area_id|references|null: false, foreign_key: true|
|preparation_day_id|references|null: false, foreign_key: true|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :preparation_day
