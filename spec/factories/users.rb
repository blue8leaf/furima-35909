FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name_kanji {Faker::Name.first_name}
    first_name_kanji {Faker::Name.last_name}
    family_name_katakana {Faker::Name.first_name}
    first_name_katakana {Faker::Name.last_name}
    birthday {Faker::Date.birthday}
  end
end