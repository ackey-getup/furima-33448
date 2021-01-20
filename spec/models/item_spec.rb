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
        expect(@item.errors.full_messages).to include('Image 画像を選択してください')
      end

      it '商品名が空では出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Title 商品名を入力してください')
      end

      it '商品の説明が空では出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation 商品の説明文を記載してください')
      end

      it 'カテゴリーの情報が無選択では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category カテゴリーを選択してください')
      end

      it '商品の状態についての情報が無選択では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status 商品の状態を選択してください')
      end
      
      it '配送料の負担についての情報が無選択では出品できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery 配送料の負担を選択してください')
      end

      it '発送元の地域についての情報が無選択では出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Region 発送元の地域を選択してください')
      end

      it '発送までの日数についての情報が無選択では出品できない' do
        @item.mean_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Mean 発送までの日数を選択してください')
      end

      it '価格についての情報が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格を設定してください')
      end

      it '価格の範囲が、¥300~¥9,999,999の間でなければ出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は半角数字で¥300~¥9,999,999の間で入力してください')
      end

      it '販売価格は半角数字でなければ出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は半角数字で¥300~¥9,999,999の間で入力してください')
      end

    end
  end
end