FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"qwe123"}
    password_confirmation { password }
    surname               { '佐藤' }
    first_name            { '太郎' }
    sei                   { 'サトウ' }
    mei                   { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end