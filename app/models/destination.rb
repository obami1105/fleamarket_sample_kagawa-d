class Destination < ApplicationRecord
  belongs_to :user, optional: true

  validates :post_code,      presence: true
  validates :prefecture_id,  presence: true
  validates :city,           presence: true
  validates :house_number,   presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
