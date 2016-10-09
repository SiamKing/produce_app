class UsersController < ApplicationController
  before_action :logged_in?

  def show
  end

  def index
    @users = User.all
  end

end
