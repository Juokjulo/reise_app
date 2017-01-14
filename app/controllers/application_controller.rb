class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :newsletter_abo])
  end

  def check_privileges!
	redirect_to "/", notice: 'You dont have enough permissions to be here' unless user_signed_in? and current_user.admin 
  end
end
