class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  layout 'login'

  def new
    @adverts = Advert.all
  end

  def create
    user = User.find_by(email: params[:user][:username])
    if !user
      user = User.find_by(phone_number: params[:user][:username])
    end
    password = params[:user][:password]

    if user && user.authenticate(password)
      session[:user] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: 'Invalid login credentials'
    end
  end

  def destroy
    reset_session #wipe out session and everything in it
    redirect_to login_path, notice: 'You have been logged out'
  end
end
