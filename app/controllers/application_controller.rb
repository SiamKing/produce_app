class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UserProduceHelper

  def welcome
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
