FactoryBot.define do
  factory :user do
    nickname              {'testuser'}
    email                 { Faker::Internet.email }
    password              {'password123'}
    password_confirmation { password }
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_date            { Date.new(2000, 1, 1) }
  end
end