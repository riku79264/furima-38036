class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  # validates :password_confirmation, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  with_options presence: true do
    
  validates :name
    # 全角漢字のみ許可する
    with_options format: {with: /\A[一-龥]+\z/, message: "is invalid. Input full-width characters."} do
      validates :family_name
      validates :first_name
    end
    # 全角カタカナのみ許可する
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :family_name_kana
      validates :family_first_name_kana
    end
    validates :birthday
  end
end
