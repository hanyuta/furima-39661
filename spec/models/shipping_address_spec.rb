require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @shipping_address = FactoryBot.build(:shipping_address)
  end

  describe "入力確認" do
    context "内容に問題がない場合" do
      it "postal_code,city,address,phone_numberが空でない、且つprefecture_idが1以外が選択されている" do
        expect(@shipping_address).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "postal_codeが空では登録できない" do
        @shipping_address.postal_code = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it "cityが空では登録できない" do
        @shipping_address.city = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "City can't be blank"
      end
      it "addressが空では登録できない" do
        @shipping_address.address = ""
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Address can't be blank"
      end
      it "phone_numberが空では登録できない" do
        @shipping_address.phone_number = ""
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it "prefecture_idが1(---)では登録できない" do
        @shipping_address.prefecture_id = 1
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "postal_codeの入力が正しくなければ登録できない" do
        @shipping_address.postal_code = 1111111
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Postal code is invalid.Enter it as follows (e.g. 123-4567)"
      end
      it "phone_numberが数字以外では登録できない" do
        @shipping_address.phone_number = "abc"
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Phone number is not a number"
      end
    end

  end
end
