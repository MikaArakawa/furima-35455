require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'パスワード：6文字以上かつ半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ニックネーム：必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'メールアドレス：必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'メールアドレス：一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'メールアドレスは：@を含む必要があること' do
        @user.email = 'aaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'パスワード：必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワード：5文字以下であれば登録できないこと' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワード：passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123aaa'
        @user.password_confirmation = '321bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'パスワード：半角英語のみは登録できないこと' do
        @user.password = 'sansan'
        @user.password_confirmation = 'sansan'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'パスワード：数字のみは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'パスワード：全角英数混合は登録できないこと' do
        @user.password = 'Sansan'
        @user.password_confirmation = 'Sansan'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it '姓：必須であること' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください')
      end

      it '名：必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end

      it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できないこと' do
        @user.surname = 'Arakawa'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は不正な値です')
      end

      it '名：全角（漢字・ひらがな・カタカナ）以外は登録できないこと' do
        @user.first_name = 'Arakawa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は不正な値です')
      end

      it '姓（フリガナ）：必須であること' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('セイを入力してください')
      end

      it '名（フリガナ）：必須であること' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メイを入力してください')
      end

      it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.sei = 'Arakawa'
        @user.valid?
        expect(@user.errors.full_messages).to include('セイは不正な値です')
      end

      it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.mei = 'Mika'
        @user.valid?
        expect(@user.errors.full_messages).to include('メイは不正な値です')
      end

      it '生年月日：必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
