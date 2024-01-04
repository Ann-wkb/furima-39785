require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.postcode = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '横浜市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.block = '旭区１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone_number = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it "postal_codeが空では保存ができないこと" do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "Prefectureが空では保存ができないこと" do
        @order_form.prefecture = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "Cityが空では保存ができないこと" do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "street_addressが空では保存ができないこと" do
        @order_form.street_address = nil
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it "phone_numberが空では保存ができないこと" do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "Tokenが空では保存ができないこと" do
        @order_form.Token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが全角では登録できない' do
        @order_form.phone_number = 'ああああ'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Price Out of setting range')
      end
      it 'phone_numberに数字以外の文字（平仮名・漢字・英字・記号）が含まれていると登録できない' do
        @order_form.phone_number = 'あアA;'
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Price Out of setting range')
      end
      it 'phone_numberが10字未満では保存できないこと' do
        @order_form.phone_number = 123456789
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが12字を超えると保存できないこと' do
        @order_form.phone_number = 123456789000
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too long')
      end
    end
  end
end
