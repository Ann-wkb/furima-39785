require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_form.building=''
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
        @order_form.postal_code = '123-4560'
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
        @order_form.street = '旭区１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone = '12345678901'
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
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
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "Cityが空では保存ができないこと" do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "streetが空では保存ができないこと" do
        @order_form.street = ''
        @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street can't be blank")
      end
      it "phoneが空では保存ができないこと" do
        @order_form.phone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角数値でないと登録できない' do
        @order_form.phone = '０9012341234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Price Out of setting range')
      end
      it 'phoneに数字以外の文字（平仮名・漢字・英字・記号）が含まれていると登録できない' do
        @order_form.phone = 'あアA;'
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが9桁以下では保存できないこと' do
        @order_form.phone = '123456789'
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too short')
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @order_form.phone = '123456789000'
        order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too long')
      end

      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
