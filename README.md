# README
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
