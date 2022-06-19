FactoryBot.define do
  factory :user do
    # transient do
    #   person { Gimei.name }
    # end
    name {'test'}
    email {Faker::Internet.free_email}
    password  {'test00'}
    password_confirmation {'test00'}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_kana {'ヤマダ'}
    family_first_name_kana {'タロウ'}
    birthday  {'2010-01-01'}
  end
end


# transient do
#   person { Gimei.name }
# end

    # name {Faker::Name.name}
    # email {Faker::Internet.free_email}
    # password password {Faker::Internet.password(min_length: 6) }
    # password_confirmation {password}
    # family_name {person.last_kanji}
    # first_name {person..first.first.kanji}
    # family_name_kana {person.last.katakana}
    # family_first_name_kana {person.first.katakana}
    # birthday  {Faker::Date.birthday}