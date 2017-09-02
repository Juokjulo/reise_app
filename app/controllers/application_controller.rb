class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :newsletter_abo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :newsletter_abo])
  end

  def check_privileges!
	redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.try(:admin?)
  end
end
