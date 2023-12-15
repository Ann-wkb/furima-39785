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
    end
      context '新規登録できないとき' do
        it 'passwordが5文字以下では登録できない' do
          @user.password = 'abc12'
          @user.password_confirmation = 'abc12'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
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
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
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
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
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
        it 'last_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.last_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana  全角（カタカナ）での入力が必須")
        end
        it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.first_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana  全角（カタカナ）での入力が必須")
        end
        it 'first_nameが半角では登録できない' do
          @user.first_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name  全角（漢字・ひらがな・カタカナ）での入力が必須")
        end
        it 'last_nameが半角では登録できない' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name  全角（漢字・ひらがな・カタカナ）での入力が必須")
        end
        it 'passwordが全角だと登録できない' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password  must be a mixture of alphanumeric characters")
        end
        it 'passwordが英字だけだと登録できない' do
          @user.password = 'aaaaaaaa'
          @user.password_confirmation = 'aaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password  must be a mixture of alphanumeric characters")
        end
        it 'passwordが数字だけだと登録できない' do
          @user.password ='11111111'
          @user.password_confirmation = '11111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password  must be a mixture of alphanumeric characters")
        end
      end
  end
