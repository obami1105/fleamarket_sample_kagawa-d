class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{7}\z/, message: "は半角数字７桁で入力してください", allow_blank: true} #ハイフンなし7桁
    validates :prefecture_id, inclusion: { in: 1..47, message: "を選択してください", allow_blank: true}
    validates :city
    validates :house_number
  end
end
