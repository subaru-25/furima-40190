FactoryBot.define do
  factory :order_form do
    postal_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { "MyString" }
    block { "MyString" }
    building { "MyString" }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end