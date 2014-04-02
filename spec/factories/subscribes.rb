# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribe do
    email "tester@mail.com"
    enable false
  end
end
