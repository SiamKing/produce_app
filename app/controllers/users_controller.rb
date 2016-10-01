class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = current_user
      produce = current_user.current_produce
      @fruit = produce.user_fruit.sort_by {|prod| prod.shelf_life}
      @veggies = produce.user_veggies.sort_by {|prod| prod.shelf_life}
    else
      redirect_to welcome_path
    end
  end

  def index
    redirect_to welcome_path unless user_signed_in?
    @users = User.all
  end



end
