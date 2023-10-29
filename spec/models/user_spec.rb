require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'password_confirmationがpasswordと一致しなければ登録できない' do
        @user.password = '123asd'
        @user.password_confirmation = '1234asd'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordは半角英数字混同でないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字混合を混同して設定してください'
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = '11a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 130, max_length: 140)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name="ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角ひらがな、カタカナ、漢字で入力してください'
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name="ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name は全角ひらがな、カタカナ、漢字で入力してください'
      end
      it 'first_name_kanaに半角文字が含まれていると登録できない' do
        @user.first_name_kana="ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana は全角カタカナで入力してください'
      end
      it 'last_name_kanaに半角文字が含まれていると登録できない' do
        @user.last_name_kana="ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana は全角カタカナで入力してください'
      end
    end
  end
end
