require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaaaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = '123qwe'
      @user.password_confirmation = '123qwe'
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、姓が必須であること' do
      @user = FactoryBot.build(:user, surname: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname is invalid')
    end

    it 'ユーザー本名は、名が必須であること' do
      @user = FactoryBot.build(:user, first_name: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.surname = 'Arakawa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname is invalid')
    end

    it 'ユーザー本名のフリガナは、姓が必須であること' do
      @user = FactoryBot.build(:user, sei: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei can't be blank")
    end

    it 'ユーザー本名のフリガナは、名が必須であること' do
      @user = FactoryBot.build(:user, mei: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include('Mei is invalid')
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.sei = 'Arakawa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sei is invalid')
    end

    it 'birthdayがない場合は登録できないこと' do
      @user = FactoryBot.build(:user, birthday: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end
end
