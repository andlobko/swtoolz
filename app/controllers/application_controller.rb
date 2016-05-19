class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = "Access denied!"
    redirect_to root_url
  end

  protected
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end
end
