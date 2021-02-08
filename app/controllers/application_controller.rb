class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン、ログアウト先の設定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_items_path
    when Customer
      items_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == Admin
      admins_sign_in_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phonenumber])
  end
end
