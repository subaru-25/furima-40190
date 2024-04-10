require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', last_name: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', first_name: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', birth_date: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = User.new(
        nickname: 'test',
        email: 'test@example',
        birth_date: '2000-01-01',
        password: '000000',
        password_confirmation: '000000',
        last_name: 'test', # Not a full-width character
        first_name: 'test' # Not a full-width character
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
      expect(user.errors.full_messages).to include("First name は全角（漢字・ぁ-んァ-ン一-龥）で入力してください")
    end

    it 'last_name_kanaとfirst_name_kanaが全角カタカナでなければ登録できない' do
      user = User.new(
        nickname: 'test',
        email: 'test@example',
        birth_date: '2000-01-01',
        password: '000000',
        password_confirmation: '000000',
        last_name: 'テスト',
        first_name: 'テスト',
        last_name_kana: 'test', # Not a full-width character
        first_name_kana: 'test' # Not a full-width character
      )
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana は全角（カタカナ）で入力してください")
      expect(user.errors.full_messages).to include("First name kana は全角（カタカナ）で入力してください")
    end

    it 'emailが適切なフォーマット（"@を含むこと"）でなければ登録できない' do
      user = User.new(nickname: 'test', email: 'testexample', birth_date: '2000-01-01', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include('Email には@を含む必要があります')
    end

    it 'passwordが要求されたフォーマット（"6文字以上かつ半角英数字混合"）でなければ登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', birth_date: '2000-01-01', password: '0000000', password_confirmation: '0000000') # password is not in a mix format
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', birth_date: '2000-01-01', password: '000000', password_confirmation: '000001') # password and password_confirmation do not match
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end