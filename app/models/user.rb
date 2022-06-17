class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    
    validates :name
    # ひらがな、カタカナ、漢字のみ許可する
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
      validates :family_name
      validates :first_name
    end
    # カタカナのみ許可する
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :family_name_kana
      validates :family_first_name_kana
    end
    validates :birthday
    # validates :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{6,}/}
  end
end
