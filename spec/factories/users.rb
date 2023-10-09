FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    surname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    mobile { Faker::Number.unique.number(digits: 10)  }
    username { Faker::Alphanumeric.unique.alphanumeric(number: 10) }
    password { Faker::Internet.password + ['@', '#', '$', '%', '&'].join('') }
  end
end