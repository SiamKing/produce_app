class UsersController < ApplicationController

  def show
    redirect_to produce_index_path unless user_signed_in?
  end

  def index
    redirect_to produce_index_path unless user_signed_in?
    @users = User.all
  end

end
