class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :show]

  def show

  end

  def index
    @users = User.all
  end
end
