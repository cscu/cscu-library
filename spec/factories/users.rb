# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"
  end

  factory :admin, class: User do
    email "admin@example.com"
    password "password"
    admin true
  end
end
