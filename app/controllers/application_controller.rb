class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :prepere_data_for_loggedout_users, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :current_password, :gender, :location, :birthday, :phone_number, :avatar])
    end

  private
    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end

    def prepere_data_for_loggedout_users
      @adverts = Advert.all
    end
end
