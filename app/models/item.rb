class Item < ApplicationRecord
  belongs_to :user
  has_one :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :item_image
    validates :trading_status
    validates :name
    validates :introduction
    validates :condition_id
    validates :shipping_fee_payer_id
    validates :prefecture_id
    validates :preparation_day_id
    validates :price
  end
  validates :name,length: { maximum: 40 }, allow_blank: true
  validates :introduction,length: { maximum: 1000 }, allow_blank: true
  validates :category_id, numericality:{ only_integer: true }, inclusion: { in: 1..733 }, allow_blank: true
  validates :condition_id, numericality:{ only_integer: true }, inclusion: { in: 1..6 }, allow_blank: true
  validates :shipping_fee_payer_id, numericality:{ only_integer: true }, inclusion: { in: 1..2 }, allow_blank: true
  validates :prefecture_id, numericality:{ only_integer: true }, inclusion: { in: 1..47 }, allow_blank: true
  validates :preparation_day_id, numericality:{ only_integer: true }, inclusion: { in: 1..3 }, allow_blank: true
  validates :price, numericality:{ only_integer: true }, inclusion: { in: 300..9999999 }, allow_blank: true

  def self.search(search)
    if search != ""
      Item.includes(:item_image).where('name Like(?)', "%#{search}%").references(:item_image)
    else
      Item.includes(:item_image).references(:item_image)
    end
  end
  
end