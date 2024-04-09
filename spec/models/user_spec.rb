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
  end
end