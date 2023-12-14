require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'example', last_name: 'example', first_name_kana: 'example', last_name_kana: 'example', birthday: '00' )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'Passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000000', first_name: 'example', last_name: 'example', first_name_kana: 'example', last_name_kana: 'example', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'Passwordが違います' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '', first_name: 'example', last_name: 'example', first_name_kana: 'example', last_name_kana: 'example', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'First name（kana）が空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'example', last_name: 'example', first_name_kana: '', last_name_kana: 'example', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'Last name（kana）が空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'example', last_name: 'example', first_name_kana: 'example', last_name_kana: '', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'First nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: '', last_name: 'example', first_name_kana: 'example', last_name_kana: 'example', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'Last nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'example', last_name: '', first_name_kana: 'example', last_name_kana: 'example', birthday: '00')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'Birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'example', last_name: 'example', first_name_kana: 'example', last_name_kana: 'example', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end