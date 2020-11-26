class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_shop, only: [:edit, :update, :destroy]
  before_action :cheak_user, only: :edit
  before_action :cheak_register, only: :new

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

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @shop.user_id
      @shop.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :address, :phone_number, :instagram, :lat, :lng).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def cheak_user
    @shop = Shop.find(params[:id])
    unless current_user.id == @shop.user_id
      redirect_to root_path
    end
  end

  def cheak_register
    if Shop.exists?(user_id: current_user.id)
      redirect_to root_path
    end
  end

end
