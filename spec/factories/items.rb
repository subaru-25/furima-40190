FactoryBot.define do
  factory :item do
    item_name { Faker::Food.dish }
    item_info { Faker::Lorem.sentence }
    item_price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 2, to: 11) } # 1以外を選ぶように2〜11を設定
    condition_id { Faker::Number.between(from: 2, to: 7) } # 前述同様
    shipping_fee_burden_id { Faker::Number.between(from: 2, to: 3) } # 前述同様
    prefecture_id { Faker::Number.between(from: 2, to: 48) } # 前述同様
    shipping_time_id { Faker::Number.between(from: 2, to: 4) } # 前述同様

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/files/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end