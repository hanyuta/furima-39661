FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'タナカ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 60) }
  end
end
