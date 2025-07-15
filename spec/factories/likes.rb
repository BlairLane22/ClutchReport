FactoryBot.define do
  factory :like do
    association :post
    association :user
    
    trait :anonymous do
      user { nil }
      session_id { "anonymous_session_#{rand(1000)}" }
    end
  end
end
