class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.sunn
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password, :avatar])
  end
end
