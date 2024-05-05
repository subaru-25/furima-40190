FactoryBot.define do
  factory :order_form do
    price { 1000 } 
    postal_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    block { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
    user_id { 1 } 
    item_id { 1 } 
    token {"tok_abcdefghijk00000000000000000"}
  end
end