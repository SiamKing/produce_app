class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :show]

  def show
    if !user_signed_in?
      redirect_to new_user_registration_path
    end
  end

  def index
    @users = User.all
  end
end
