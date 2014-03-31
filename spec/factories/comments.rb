FactoryGirl.define do
  factory :comment do
    content 'content' * 10
    type Post::TECH
    association :post
  end
end
