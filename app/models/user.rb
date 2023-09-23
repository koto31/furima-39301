class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :items
  #has_many :orders

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format:{with: VALID_PASSWORD_REGEX} 
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true
end
