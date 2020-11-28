require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '店舗登録' do
    before do
      @shop = FactoryBot.build(:shop)
    end

    it 'すべての値が入力されていれば登録できる' do
      expect(@shop).to be_valid
    end

    it 'shop_nameが空では登録できない' do
      @shop.shop_name = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Shop name can't be blank")
    end
    
    it 'addressが空では登録できない' do
      @shop.address = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Address can't be blank")
    end

    it 'addressが40文字以上だと登録できない' do
      @shop.address = "a" * 41
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Address is too long (maximum is 40 characters)")
    end

    it 'instagramが空だと登録できない' do
      @shop.instagram = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Instagram can't be blank")
    end

    it 'instagramが30文字以上だと登録できない' do
      @shop.instagram = "a" * 31
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Instagram is too long (maximum is 30 characters)")
    end

    it 'phone_numberが空だと登録できない' do
      @shop.phone_number = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11桁以上だと登録できない' do
      @shop.phone_number = "0901234567890"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberにハイフンがあると登録できない' do
      @shop.phone_number = "090-1234-5678"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Phone number is invalid")
    end

    it 'latが空だと登録できない' do
      @shop.lat = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Lat 指定場所を地図にクリックしてください")
    end

    it 'lngが空だと登録できない' do
      @shop.lng = nil
      @shop.valid?
      expect(@shop.errors.full_messages).to include()
    end
  end
end
