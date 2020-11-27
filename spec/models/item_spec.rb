require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do 
      @item = FactoryBot.build(:item)
    end

    describe '商品出品の保存' do
      context '商品出品の保存ができる場合' do
        it "image、name、introduction、category_id、item_condition_id、postage_payer_id、prefecture_code_id、preparation_day_id、priceが存在すれば保存できる" do
          expect(@item).to be_valid
        end

        it "nameが40文字以下であれば保存できる" do
          @item.name = "a" * 40
          expect(@item).to be_valid
        end

        it "introductionが1000文字以下であれば保存できる" do
          @item.introduction = "a" * 1000
          expect(@item).to be_valid
        end

        it "priceが半角数字であれば保存できる" do
          @item.price = 1000
          expect(@item).to be_valid
        end
      end

      context '商品出品の保存ができない場合' do
        it "imageが空では保存できない" do
          @item.image = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "nameが空では保存できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "nameが41文字以上だと保存できない" do
          @item.name = "a" * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
        end

        it "introductionが空では保存できない" do
          @item.introduction = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end

        it "introductionが1001文字以上だと保存できない" do
          @item.introduction = "a" * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)")
        end

        it "category_idが空では保存できない" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end

        it "item_condition_idが空では保存できない" do
          @item.item_condition_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition Select")
        end

        it "postage_payer_idが空では保存できない" do
          @item.postage_payer_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer Select")
        end

        it "prefecture_code_idが空では保存できない" do
          @item.prefecture_code_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture code Select")
        end

        it "preparation_day_idが空では保存できない" do
          @item.preparation_day_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Preparation day Select")
        end

        it "priceが空では保存できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが半角数字以外で入力されば場合は保存できない" do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number")
        end

        it "userが紐付いていないと保存できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end


