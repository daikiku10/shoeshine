require 'rails_helper'

RSpec.describe '店舗登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop)
  end
  context '店舗登録ができるとき' do
    it 'ログインしたユーザーは店舗登録ができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 店舗登録ページへのリンクがあることを確認する
      expect(page).to have_content('店舗登録')
      # 登録ページに移動する
      visit new_shop_path
      # フォームに情報を入力する
      fill_in 'shop-name', with: @shop.shop_name
      fill_in 'address', with: @shop.address
      fill_in 'phone-number', with: @shop.phone_number
      fill_in 'instagram', with: @shop.instagram
      # find('div[id="new-map"]').click
      # fill_in 'lat', with: @shop.lat
      # fill_in 'lng', with: @shop.lng
      # 登録するとShopモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Shop.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # トップページに編集できる「店舗登録変更」ボタンがあることを確認する
      expect(page).to have_content('店舗登録変更')
    end
  end
end
