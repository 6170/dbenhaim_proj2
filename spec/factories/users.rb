# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	id 1
    name 'Billy'
    email 'Billy@example.com'
    password 'please'
    password_confirmation 'please'
  end
end
