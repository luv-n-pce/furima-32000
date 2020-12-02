require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it "必須項目がすべて正しく入力されていれば保存できる" do
      expect(@order_address).to be_valid
    end

    it "tokenが空では登録できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空だと保存できない" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end

    it "prefecture_idが空だと保存できない" do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select")
    end

    it "prefecture_idが1以外でないと保存できない" do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select")
    end

    it "cityが空だと保存できない" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空だと保存できない" do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it "building_nameが空でも保存できる" do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end

    it "phone_numberが空だと保存できない" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが10桁または11桁以外だと保存できない" do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberは数字のみでないと保存できない" do
      @order_address.phone_number = "090-1234-56789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
