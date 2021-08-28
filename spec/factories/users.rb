FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'aaa000' }
    password_confirmation { password }
    family_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    family_name_katakana { 'ヤマダ' }
    first_name_katakana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
