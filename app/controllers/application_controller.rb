class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale
   
  def set_locale
    I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end  
end

