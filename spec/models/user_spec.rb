require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do 
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname、email、password、password_confirmation、last_name first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる" do
          expect(@user).to be_valid
        end

        it "nicknameが40文字以下であれば登録できる" do
          @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          expect(@user).to be_valid
        end

        it "passwordが6文字以上で英数字の組み合わせであれば登録できる" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          expect(@user).to be_valid
        end

        it "last_nameが全角文字であれば登録できる" do
          @user.last_name = "山田"
          expect(@user).to be_valid
        end

        it "first_nameが全角文字であれば登録できる" do
          @user.first_name = "太郎"
          expect(@user).to be_valid
        end
        
        it "last_name_kanaが全角カナ文字であれば登録できる" do
          @user.last_name_kana = "ヤマダ"
          expect(@user).to be_valid
        end

        it "first_name_kanaが全角カナ文字であれば登録できる" do
          @user.first_name_kana = "タロウ"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "nicknameが41文字以上だと登録できない"do
          @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "重複したemailが存在する場合は登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが5文字以下では登録できない" do
          @user.password = "abc12"
          @user.password_confirmation = "abc12"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが数字のみの場合は登録できない" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password includes both letters and numbers")
        end

        it "passwordが英文字のみの場合は登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password includes both letters and numbers")
        end

        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "last_name_kanaが空では登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end

      end
    end
  end
end
