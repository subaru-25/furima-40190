class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birth_date, presence: true
       
         validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/, message: 'には@を含む必要があります' }  
         validates :password, presence: true, length: {minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'は6文字以上かつ半角英数字混合で入力してください' }, confirmation: true
       
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'}
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ぁ-んァ-ン一-龥）で入力してください'}
       
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください'}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください'}
       end
