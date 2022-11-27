module Accessibled
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_owner
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      #redirect_to(rails_admin.dashboard_path) and return

      flash[:info] = 'You are owner (from Acessible)'
      redirect_to owners_root_path and return
    elsif current_customer
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      #redirect_to(authenticated_user_root_path) and return

      flash[:info] = 'You are customer (from Acessible)'
      redirect_to root_path and return
    end
  end
end