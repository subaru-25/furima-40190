require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 # ここが正常系のテストコード
 context '商品が出品できるとき' do
  it '全ての値が入っていれば登録できる' do
    expect(@item).to be_valid
  end
end

 # 下記が異常系のテストコード
 context '商品が出品できないとき' do

   # userがログインしていないと登録できない
   it 'userが紐づいていなければ登録できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
  end

  # imageは0枚では登録できない
  it '画像が存在しないと保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  # item_nameは空では登録できない
  it 'item_nameが空では登録できないこと' do
    @item.item_name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

    # item_infoは空では登録できない
    it 'item_infoが空では登録できないこと' do
      @item.item_info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end

  # category_idは初期値では登録できない
  it 'category_idが初期値では登録できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  
  # condition_idは初期値では登録できない
  it 'condition_idが初期値では登録できないこと' do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  
  # shipping_fee_burden_idは初期値では登録できない
  it 'shipping_fee_burden_idが初期値では登録できないこと' do
    @item.shipping_fee_burden_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
  end
  
  # prefecture_idは初期値では登録できない
  it 'prefecture_idが初期値では登録できないこと' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
  
  # shipping_time_idは初期値では登録できない
  it 'shipping_time_idが初期値では登録できないこと' do
    @item.shipping_time_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping time can't be blank")
  end

    # item_priceは空では登録できない
    it 'item_priceが空では登録できないこと' do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
    end

  # item_priceは¥300以下は登録できない
  it 'item_priceが¥300以下では登録できないこと' do
    @item.item_price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
  end

    # item_priceは¥9,999,999以上は登録できない
    it 'item_priceが¥9,999,999以上は登録できないこと' do
      @item.item_price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
    end
  
    # item_priceは全角では登録できない
    it 'item_priceが全角では登録できないこと' do
      @item.item_price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is not a number')
    end
  
    # item_priceは半角英語では登録できない
    it 'item_priceが半角英語では登録できないこと' do
      @item.item_price = 'abcdef'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is not a number')
    end
  end
  end