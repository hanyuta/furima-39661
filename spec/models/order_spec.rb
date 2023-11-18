require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '入力確認' do
    context '内容に問題がない場合' do
      it '全ての情報が正しく入力されている' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'prefecture_idが1(---)では登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'postal_codeの入力が正しくなければ登録できない' do
        @order.postal_code = 1_111_111
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postal code is invalid.Enter it as follows (e.g. 123-4567)'
      end
      it 'phone_numberが数字以外では登録できない' do
        @order.phone_number = 'abcaaaabca'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order.phone_number = '111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is too long'
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order.phone_number = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is too short'
      end
      it 'itemが紐づいていなければ保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end
      it 'userが紐づいていなければ保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it 'tokenが空では登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
