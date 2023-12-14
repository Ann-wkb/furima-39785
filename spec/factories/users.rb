FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd123'}
    password_confirmation {password}
    first_name            {'テスト'}
    last_name             {'テスト'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テスト'}
    birthday              {'1111-11-11'}
  end
end