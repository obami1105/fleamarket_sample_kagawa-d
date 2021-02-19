FactoryBot.define do
  factory :credit_card do
    user_id       {FactoryBot.create(:user).id}
    customer_id   {"cus_xxxxxxxxxxxxxxxxxxxxxxxxx"}
    card_id       {"car_xxxxxxxxxxxxxxxxxxxxxxxxx"}
  end
end
