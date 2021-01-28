class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  has_one :item_image, dependent: :destroy
  belongs_to :category, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :seller
    validates :trading_status
    validates :name
    validates :ntroduction
    validates :category
    validates :item_condition_id
    validates :shipping_fee_payer_id
    validates :prefecture_id
    validates :preparation_day_id
    validates :price
  end
end
