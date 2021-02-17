class ItemImage < ApplicationRecord
  belongs_to :item

  mount_uploader :image_url, ImageUploader
  
  validates :image_url, presence: true

  def self.search(search)
    if search != ""
      ItemImage.where('name Like(?)', "%#{search}%")
    else
      ItemImage.all
    end
  end
end
