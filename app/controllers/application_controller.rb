class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
    devise_parameter_sanitizer.permit(:new_item, keys: [:name, :explanation, :category_id, :bland_id, :shipping_id, :shipping_area_id, :shipping_date_id, :price])
  end
end
