class ShopsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @shops = Shop.includes(:user)
    @users = User.all
    gon.users = @users
    gon.shops = @shops
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:address, :phone_number, :instagram, :lat, :lng).merge(user_id: current_user.id)
  end
end
