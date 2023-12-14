FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd123'}
    password_confirmation {password}
    first_name            {'example'}
    last_name             {'example'}
    first_name_kana       {'example'}
    last_name_kana        {'example'}
    birthday              {'1111-11-11'}
  end
end