FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test Post #{n}" }
    content { "This is test content for the post." }
    published { true }
    association :user
    association :category
  end
end
