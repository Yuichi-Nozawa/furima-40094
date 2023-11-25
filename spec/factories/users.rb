FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'あ'}
    first_name            {'あ'}
    last_name_kana        {'ア'}
    first_name_kana       {'ア'}
    birth_date do
      year = Faker::Number.between(from: 1900, to: 2023)
      month = Faker::Number.between(from: 1, to: 12)
      day = Faker::Number.between(from: 1, to: 28)

      Date.new(year, month, day)
    end
  end
end