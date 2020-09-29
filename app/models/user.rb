class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合にしてください' }

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナ全角で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナ全角で入力してください' }
    validates :birthday
  end
end

