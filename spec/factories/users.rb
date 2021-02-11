FactoryBot.define do
  factory :user do
    nickname              {"kagawa"}
    email                 {"sample@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birth_date            {"1990-01-01"}
    family_name           {"香川"}
    first_name            {"太郎"}
    family_name_kana      {"かがわ"}
    first_name_kana       {"たろう"}
  end
end
