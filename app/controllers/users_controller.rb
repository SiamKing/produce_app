class UsersController < ApplicationController

  def show
    if user_signed_in?
      produce = current_user.current_produce
      @fruit = produce.user_fruit.sort_by {|prod| prod.shelf_life}
      @veggies = produce.user_veggies.sort_by {|prod| prod.shelf_life}
    else
      redirect_to welcome_path
    end
  end

  def index
    redirect_to produce_index_path unless user_signed_in?
    @users = User.all
  end

  def eaten
    @user_produce = UserProduce.find(params[:format])
    @user_produce.update_attributes(eaten?: true)
    @user_produce.save
    flash[:notice] = "Good for you! You ate your #{@user_produce.produce.name}!"
    redirect_to user_path(current_user)
  end

end
