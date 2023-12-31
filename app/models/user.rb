class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :furimas
  has_many :logs

  validates :nickname, presence: true
  validates :birth_date, presence: true


  validates :password,
    presence: true,
    length: { minimum: 6 },
    format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
       
end
