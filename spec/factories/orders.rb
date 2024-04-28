# FactoryBot.define do
#   factory :order do
#     association :user
#     association :item

#     after(:create) do |order|
#       create(:address, order: order)
#     end
#   end

#   factory :address do
#     postal_code {'123-4567'}
#     prefecture_id { 1 }
#     city { 'Tokyo' }
#     block { '1-1' }
#     building { 'Tokyo building' }
#     phone_number {'09012345678'}
#     order
#   end
# end