require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'user_nameが空では登録できない' do
      @user.user_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("User name can't be blank")
    end

    it 'user_nameが半角では登録できない' do
      @user.user_name = "daiki kudo"
      @user.valid?
      expect(@user.errors.full_messages).to include("User name is invalid")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに＠がないと登録できない' do
      @user.email = "sample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが全角では登録できない' do
      @user.password = "１２３４５６"
      @user.password_confirmation = "１２３４５６"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
