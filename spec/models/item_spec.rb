require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'item_name、item_info、item_price、user_idが空白でない且つ、item_category_id、item_sales_status_id、item_shipping_fee_status_id、prefecture_id、item_scheduled_delivery_idが全て1以外が選択されている' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_imageが空では登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'item_sales_status_idが1(---)では登録できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end
      it 'item_shipping_fee_status_idが1(---)では登録できない' do
        @item.item_shipping_fee_staus_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee staus can't be blank"
      end
      it 'prefecture_idが1(---)では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'item_scheduled_delivery_idが1(---)では登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end
      it 'item_category_idが1(---)では登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceが日本語では登録できない' do
        @item.item_price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is only numbers'
      end
      it 'item_priceが英字では登録できない' do
        @item.item_price = 'ABC'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is only numbers'
      end
      it 'item_priceが全角数字では登録できない' do
        @item.item_price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is only numbers'
      end
      it 'item_priceが300より小さいと登録できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is only numbers'
      end
      it 'item_priceが999999より大きいと登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is only numbers'
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
