class UsersController < ApplicationController

  def show
    redirect_to produce_index_path unless user_signed_in?
    current_user
    @fruit = current_user.user_produce.user_fruit
    @veggies = current_user.user_produce.user_veggies
  end

  def index
    redirect_to produce_index_path unless user_signed_in?
    @users = User.all
  end

end
