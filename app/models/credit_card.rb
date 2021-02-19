class CreditCard < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :customer_id
    validates :card_id
  end
end
