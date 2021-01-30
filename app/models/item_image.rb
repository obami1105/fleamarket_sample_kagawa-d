class ItemImage < ApplicationRecord
  belongs_to :item

  validates :image_url, presence: true

  mount_uploader :image_url, ImageUploader
end
