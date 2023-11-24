class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
    presence: true,
    length: { minimum: 6 },
    format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
       
end
