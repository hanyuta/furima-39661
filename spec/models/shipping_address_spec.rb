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
      end
      it "cityが空では登録できない" do
      end
      it "addressが空では登録できない" do
      end
      it "phone_numberが空では登録できない" do
      end
      it "prefecture_idが1(---)では登録できない" do
      end
    end

  end
end
