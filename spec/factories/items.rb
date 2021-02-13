FactoryBot.define do
  factory :item do
    trading_status          {0}
    name                    {"携帯"}
    introduction            {"１年間使用しているため使用傷があります。"}
    condition_id            {1}
    shipping_fee_payer_id   {1}
    prefecture_id           {1}
    preparation_day_id      {1}
    price                   {10000}
    
    user
    category
    item_image
  end

end