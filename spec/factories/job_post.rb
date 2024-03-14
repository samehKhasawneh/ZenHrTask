FactoryBot.define do
  factory :job_post do
    title { 'Software Engineer' }
    description { 'Join our awesome team!' }
    association :user, factory: :user

    trait :missing_title do
      title { nil }
    end
  end
end