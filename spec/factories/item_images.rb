FactoryBot.define do
  factory :item_image do
    image_url    {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end

end
