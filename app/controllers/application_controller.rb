class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user_or_agent!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :email, :first_name, :timezone, :photo, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :timezone, :photo, :password])
  end

  private

  def authenticate_user_or_agent!
    return if current_user.present? || current_agent.present?

    redirect_to new_user_session_path
  end
end
