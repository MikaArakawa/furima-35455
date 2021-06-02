require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は任意であること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号は半角でないと保存できないこと' do
        @order_address.postal_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が必須であること' do
        @order_address.prefecture = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県は1以外であること' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が必須であること' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は10桁以上の場合のみ保存可能なこと' do
        @order_address.phone = '090111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号は11桁以内の場合のみ保存可能なこと' do
        @order_address.phone = '090111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号はハイフンを含まないこと' do
        @order_address.phone = '090-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid', 'Phone is not a number')
      end

      it '電話番号は半角数値のみ保存可能であること' do
        @order_address.phone = '０９０１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid', 'Phone is not a number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
