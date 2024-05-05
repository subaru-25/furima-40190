require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form, postal_code: "123-4567", phone_number: "09012345678")
  end

  # ここが正常系のテストコード
  context '登録成功時' do
    it '全ての項目が存在すれば登録できる' do
      expect(@order_form).to be_valid
    end

    it "priceとtokenがあれば保存ができること" do
      expect(@order_form).to be_valid
    end

    it '建物名は任意である' do
      @order_form.building = ''
      expect(@order_form).to be_valid
    end
  end

# 下記が異常系のテストコード
  context '登録失敗時' do
    it '郵便番号が空だと登録できない' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code は不正な値です")
    end

    it '郵便番号は3桁ハイフン4桁の半角文字列のみ保存可能' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code は不正な値です")
    end
  
    it '郵便番号が半角文字列でないと保存できない' do
      @order_form.postal_code = '１２３-４５６７'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code は不正な値です")
    end

    it '郵便番号にハイフンがないと登録ができない' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code は不正な値です")
    end

    it '都道府県が空だと登録できない' do
      @order_form.prefecture_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")  
    end

    it '市区町村が空だと登録できない' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank") 
    end

    it '番地が空だと登録できない' do
      @order_form.block = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Block can't be blank") 
    end

    it '電話番号が空だと登録できない' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number は不正な値です")
    end

    it '電話番号が10桁未満では登録できない' do
      @order_form.phone_number = '123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number は不正な値です")
    end
  
    it '電話番号が11桁を超えると登録できない' do
      @order_form.phone_number = '123456789012'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number は不正な値です")
    end
  
    it '電話番号が半角数値でないと登録できない' do
      @order_form.phone_number = '０９０１２３４５６７８'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number は不正な値です")
    end
    
    it "tokenが空では保存ができないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

  end
 end
