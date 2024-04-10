FactoryBot.define do 
  factory :user do 
    nickname { "test" }
    email { "test@example.com" }
    password { "a123456" }
    password_confirmation { "a123456" }
    last_name { "田中" }
    first_name { "太郎" }
    last_name_kana { "タナカ" }
    first_name_kana { "タロウ" }
    birth_date { '2000-01-01' }
  end
end