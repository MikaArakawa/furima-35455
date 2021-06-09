require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題がない場合' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('説明を入力してください')
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it 'カテゴリーの情報が初期値のままでは保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end

      it '商品の状態についての情報が必須であること' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end

      it '商品の状態についての情報が初期値のままでは保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end

      it '配送料の負担についての情報が初期値のままでは保存できないこと' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end

      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end

      it '発送元の地域についての情報が初期値のままでは保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end

      it '発送までの日数についての情報が初期値のままでは保存できないこと' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it '販売価格は整数であること' do
        @item.price = '300.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は整数で入力してください')
      end

      it '販売価格の下限が¥300であること' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it '販売価格の上限が¥9,999,999であること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it '販売価格は全角数字では保存できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '販売価格は数字以外の文字列では保存できないこと' do
        @item.price = '三百円'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '販売価格は半角英数混合では登録できないこと' do
        @item.price = '3hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '販売価格は半角英語だけでは登録できないこと' do
        @item.price = 'three hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
    end
  end
end
