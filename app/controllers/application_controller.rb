class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! or :authenticate_agent!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :timezone, :photo, :password])
    devise_parameter_sanitizer.permit(:update, keys: [:email, :first_name, :timezone, :photo, :password])
  end
end
