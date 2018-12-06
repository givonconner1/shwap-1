class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin?
      pages_pending_path
    else
    pages_dashboard_path
    end
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :request_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
