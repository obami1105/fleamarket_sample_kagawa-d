class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  # belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  has_one :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image
  belongs_to :category, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    # validates :user, presence: true
    # validates :seller, presence: true
    validates :trading_status, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :category, presence: true
    validates :condition_id, presence: true
    validates :shipping_fee_payer_id, presence: true
    validates :prefecture_id, presence: true
    validates :preparation_day_id, presence: true
    validates :price, presence: true
  end
end
