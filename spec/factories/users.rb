FactoryBot.define do
  factory :user do
    email { "john@example.com" }
    password { "123456" }

    trait :missing_email do
      email { nil }
    end
  end
end