require 'rails_helper'

# RSpec.describe Order, type: :model do
#   before do
#     @order = FactoryBot.build(:order)
#   end

#   # ここが正常系のテストコード
#   context '登録成功時' do
#     it '全ての項目が存在すれば登録できる' do
#       expect(@order).to be_valid
#     end

#     it '建物名は任意である' do
#       @order.building = ''
#       expect(@order).to be_valid
#     end
#   end

# # 下記が異常系のテストコード
#   context '登録失敗時' do
#     it '郵便番号が空だと登録できない' do
#       @order.postal_code = ''
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Postal code can't be blank") 
#     end

#     it '郵便番号は3桁ハイフン4桁の半角文字列のみ保存可能' do
#       @order.postal_code = '1234567'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
#     end
  
#     it '郵便番号が半角文字列でないと保存できない' do
#       @order.postal_code = '１２３-４５６７'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
#     end

#     it '郵便番号にハイフンがないと登録ができない' do
#       @order.postal_code = '1234567'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
#     end

#     it '都道府県が空だと登録できない' do
#       @order.prefecture_id = ''
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Prefecture id can't be blank")  
#     end

#     it '市区町村が空だと登録できない' do
#       @order.city = ''
#       @order.valid?
#       expect(@order.errors.full_messages).to include("City can't be blank") 
#     end

#     it '番地が空だと登録できない' do
#       @order.block = ''
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Block can't be blank") 
#     end

#     it '電話番号が空だと登録できない' do
#       @order.phone_number = ''
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Phone number can't be blank")  
#     end

#     it '電話番号が10桁未満では登録できない' do
#       @order.phone_number = '123456789'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("電話番号は不正な値です")
#     end
  
#     it '電話番号が11桁を超えると登録できない' do
#       @order.phone_number = '123456789012'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("電話番号は不正な値です")
#     end
  
#     it '電話番号が半角数値でないと登録できない' do
#       @order.phone_number = '０９０１２３４５６７８'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("電話番号は不正な値です")
#     end

#   end
#  end