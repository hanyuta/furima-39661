class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :first_name,       presence: true
  validates :last_name,        presence: true
  validates :first_name_kana,  presence: true
  validates :last_name_kana,   presence: true
  validates :birthday,         presence: true

  validates :password,         presence: true,
                                format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/, message: "は半角英数字混合を混同して設定してください" }

end
