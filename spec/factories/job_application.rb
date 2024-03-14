FactoryBot.define do
  factory :job_application do
    status { false }
    association :user, factory: :user
    association :job_post, factory: :job_post
  end
end
