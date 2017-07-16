class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?

  logger.debug "inside ApplicationController..."

  #def after_sign_in_path_for(resource)
  #  request.env['omniauth.origin'] || stored_location_for(resource) || products_path
  #end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:first_name, :last_name, :email, :password)
      end
    end

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, alert: exception.message
  end

  private
    def store_current_location
      store_location_for(:user, request.url)
    end
end
