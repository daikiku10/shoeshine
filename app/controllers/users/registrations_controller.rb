class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:shop_name, :instagram, :homepage, :phone_number, :prefecture, :city, :house_number, :building_name])
  end
end