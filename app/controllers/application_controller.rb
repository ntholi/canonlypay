class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_login

  protected
    def ensure_login
      redirect_to login_path unless session[:user]
    end

    def logged_in?
      session[:user]
    end

    def current_user
      @current_user ||= User.find(session[:user])
    end
end
