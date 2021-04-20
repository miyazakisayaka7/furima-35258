FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'123456a'}
    password_confirmation {password}
    last_name             {'太郎'}
    first_name            {'アイウエオ'}
    last_name_reading     {'アイウエオ'}
    first_name_reading    {'アイウエオ'}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)} 
  end
end
