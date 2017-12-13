class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :notice, :alert, :info

  def welcome
    if user_signed_in?
      redirect_to user_produce_path(current_user)
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def logged_in?
    if !user_signed_in?
      flash[:alert] = "Please log in"
      redirect_to welcome_path
    end
  end
end
