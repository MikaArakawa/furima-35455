require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/aassets/images/flag.png')
    end

    context '内容に問題がない場合' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
      end
    end

    context '内容に問題がある場合' do
      it '商品画像を1枚つけることが必須であること' do
      end

      it '商品名が必須であること' do
      end

      it '商品の説明が必須であること' do
      end

      it 'カテゴリーの情報が必須であること' do
      end

      it '商品の状態についての情報が必須であること' do
      end

      it '配送料の負担についての情報が必須であること' do
      end

      it '発送元の地域についての情報が必須であること' do
      end

      it '発送までの日数についての情報が必須であること' do
      end

      it '販売価格についての情報が必須であること' do
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      end

      it '販売価格は半角数字のみ保存可能であること' do
      end
    end
  end
end
