class UsersController < ApplicationController
  layout "application"
  before_action :logged_in?

  def show

  end

  def index
    @users = User.all
  end

end
