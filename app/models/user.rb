class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :items
  #has_many :orders

  validates :nickname, presence: true
  validates :password, presence: true, format:{with: /\A[a-zA-Z0-9]+\z/} 
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true
end
