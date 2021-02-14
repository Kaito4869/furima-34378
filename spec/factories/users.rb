FactoryBot.define do
  factory :user do
    nickname  { Faker::Name.initials }
    email     { Faker::Internet.free_email }
    password  { Faker::Internet.password(min_length: 7) }
    password_confirmation { password }
    family_name { '田中' }
    first_name { '太郎' }
    family_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth_date { 1999 - 0o6 - 13 }
  end
end
