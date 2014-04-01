# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribe do
    email "MyString"
    enable false
  end
end
