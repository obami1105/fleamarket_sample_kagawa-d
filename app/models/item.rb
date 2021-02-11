class Item < ApplicationRecord
  has_one :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image
end
