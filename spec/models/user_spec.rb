require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do

      it "nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが半角英数字を含む6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do

      it "nicknameが空では登録できない"do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていない場合登録できない" do
        @user.email = "abc.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英字のみの場合登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字の両方を含めて6文字以上で設定してください")
      end

      it "passwordが数字のみの場合登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字の両方を含めて6文字以上で設定してください")
      end

      it "passwordが全角の場合登録できない" do
        @user.password = "１２３ａｂｃ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角英数字の両方を含めて6文字以上で設定してください")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "123abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_nameが全角漢字、ひらがな、カタカナ以外の場合登録できない" do
        @user.last_name = "Lastname"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end

      it "first_nameが全角漢字、ひらがな、カタカナ以外の場合登録できない" do
        @user.first_name = "Firstname"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end

      it "last_name_kanaが全角カタカナでないと登録できない" do
        @user.last_name_kana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana カタカナで入力してください")
      end

      it "first_name_kanaが全角カタカナでないと登録できない" do
        @user.first_name_kana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana カタカナで入力してください")      
      end

      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end