class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers."}
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Cannot be registered with a password that includes double-byte characters."}                                                                           
  with_options presence: true do
    validates :name
    # 全角（漢字・ひらがな・カタカナ）のみ許可する
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "is invalid. Input full-width characters."} do
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

  has_many :items
end
