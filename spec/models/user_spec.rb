require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'First name（kana）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name (kana) can't be blank")
      end
      it 'Last name（kana）が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name (kana) can't be blank")
      end
      it 'First nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'Last nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'nicknameが7文字以上では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが129文字以上では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
      it 'First name（kana）が空では登録できない' do
      end
      it 'Last name（kana）が空では登録できない' do
      end
      it 'Passwordは、全角では登録できない' do
      end
      it 'Passwordは、英字だけでは登録できない' do
      end
      it 'first name（kana）は、半角では登録できない' do
      end
      it 'first name（kana）は、英語では登録できない' do
      end
      it 'first name（kana）は、数字では登録できない' do
      end
      it 'last name（kana）は、半角では登録できない' do
      end
      it 'lirst name（kana）は、英語では登録できない' do
      end
      it 'lirst name（kana）は、ひらがなでは登録できない' do
      end
      it 'first name（kana）は、ひらがなでは登録できない' do
      end
      it 'last name（kana）は、半角では登録できない' do
      end
      it 'first nameは、半角では登録できない' do
      end
      it 'first nameは、英語では登録できない' do
      end
      it 'first nameは、数字では登録できない' do
      end
      it 'last nameは、半角では登録できない' do
      end
      it 'lirst nameは、英語では登録できない' do
      end
      it 'lirst nameは、数字では登録できない' do
      end
    end
  end
end
