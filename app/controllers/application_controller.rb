class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :prepere_data_for_loggedout_users

  layout :layout_by_resource

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
