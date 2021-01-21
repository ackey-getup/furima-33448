require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    
    context '出品できる' do

      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない' do

      it '商品画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が無選択では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 選択してください")
      end

      it '商品の状態についての情報が無選択では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 選択してください")
      end
      
      it '配送料の負担についての情報が無選択では出品できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery 選択してください")
      end

      it '発送元の地域についての情報が無選択では出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region 選択してください")
      end

      it '発送までの日数についての情報が無選択では出品できない' do
        @item.mean_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Mean 選択してください")
      end

      it '価格についての情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間でなければ出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end

      it '販売価格は半角数字でなければ出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end
      
      it 'priceは半角英数混合では登録できないこと' do
        @item.price = "300abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end

      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end

      it 'priceは10,000,000以上では登録できないこと' do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end

      it '発送までの日数についての情報が1以外でないと登録できないこと' do
        @item.mean_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Mean 選択してください")
      end

      it '発送元の地域についての情報が1以外でないと登録できないこと' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region 選択してください")
      end

      it 'カテゴリーの情報が1以外でないと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 選択してください")
      end

      it '配送料の負担についての情報が1以外でないと登録できないこと' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery 選択してください")
      end

      it '商品の状態についての情報が1以外でないと登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 選択してください")
      end

      it 'priceが¥299の場合出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角数字で¥300~¥9,999,999の間で入力してください")
      end
    end
  end
end