require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # ここが正常系のテストコード
  describe 'ユーザー新規登録' do
      context '新規登録できるとき' do  
        it '全ての項目が存在すれば登録できる' do
          expect(@user).to be_valid  
        end
  end

  # 下記が異常系のテストコード
  context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailは空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが@を含まない場合は登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailは一意性でないと登録できない' do
      user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors.full_messages).to include('Email has already been taken')
  end

      
  it 'birth_dateが空では登録できない' do
    @user.birth_date = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end

    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end
    
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字・ぁ-んァ-ン一-龥）で入力してください")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角（カタカナ）で入力してください")
    end
    
    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角（カタカナ）で入力してください")
    end

    it 'passwordは空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以下では登録できない' do
      @user.password = '123Ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字混合で入力してください')
    end
    
    it 'passwordが半角英語だけでは登録できない' do
      @user.password = 'Abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字混合で入力してください')
    end
    
    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字混合で入力してください')
    end
    
    it 'passwordが全角を含むと登録できない' do
      @user.password = '123Abあ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ半角英数字混合で入力してください')
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      @user.password = 'password1'
      @user.password_confirmation = 'password2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
  end
 end
end


