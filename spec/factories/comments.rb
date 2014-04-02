FactoryGirl.define do
  factory :comment do
    content 'content' * 10
    name 'commentor'
    email 'tester@xx.com'
    association :post
  end

  factory :comment_no_post, class: Comment do
    content 'content' * 10
    name 'commentor'
    email 'tester@xx.com'
  end
end
