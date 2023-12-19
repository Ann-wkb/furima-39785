require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

      context '出品できるとき' do
        it 'imageとprice、category_idとitem_title、item_descriptionとcondition_id、shipping_cost_idとprefecture_idとshipping_date_idが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '保存できない' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'priceが空では登録できない' do
          @item.price = 'testmail'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'priceが全角では登録できない' do
          @item.price = 'ああああ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'priceに数字以外の文字（平仮名・漢字・英字・記号）が含まれていると登録できない' do
          @item.price = 'あアA;'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it 'category_idが空では登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'item_titleが空では登録できない' do
          @item.item_title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item title can't be blank")
        end
        it 'item_descriptionが空では登録できない' do
          @item.item_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description can't be blank")
        end
        it 'condition_idが空では登録できない' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it 'shipping_cost_idが空では登録できない' do
          @item.shipping_cost_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
        end
        it 'shipping_date_idが空では登録できない' do
          @item.shipping_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
        end
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'priceは¥300~¥9,999,999までしか登録できない' do
          @item.price = Faker::Number.between(from: 300, to: 9_999_999)
          @item.valid?
        end
      end
  end
  
end

