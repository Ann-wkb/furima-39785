require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
      end
      it 'first_nameとlast_name、first_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
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
