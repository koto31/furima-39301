FactoryBot.define do
  factory :user do
        nickname              { Faker::Name.initials }
        email                 { Faker::Internet.free_email }
        password              { 'a1'+Faker::Internet.password(min_length: 4, mix_case: false) }
        password_confirmation { password }
        last_name             { '山田'}
        first_name            { '花子'}
        last_name_kana        { 'ヤマダ'}
        first_name_kana       { 'ハナコ'}
        birth_date            { Faker::Date.between(from: '1997-01-01', to:'2023-12-31') }
  end
end
