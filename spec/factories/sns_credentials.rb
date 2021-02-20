FactoryBot.define do
  factory :sns_credential do
    provider          {"google_oauth2"}
    uid               {"123456789012345678901"}

    user
  end
end
