FactoryGirl.define do
  factory :post do
    title 'this is a post title'
    content 'content' * 10
    type Post::TECH
  end

  factory :post_list, class: Post do
    sequence(:title) { |n| "#{n}: post title" }
    content 'content' * 10
    sequence(:created_at) { |n| n.days.ago }
    type Post::TECH
  end
end
