class ShopsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @shops = Shop.includes(:user)
    gon.shops = @shops
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
  end

  private
  def shop_params
    params.require(:shop).permit(:address, :phone_number, :instagram, :lat, :lng).merge(user_id: current_user.id)
  end
end
