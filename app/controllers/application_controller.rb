class ApplicationController < ActionController::Base
  include Authorized

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   update_attrs = [:password, :password_confirmation, :current_password, :email, :name, :avatar, :phone_number]
  #   devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  # end
end
