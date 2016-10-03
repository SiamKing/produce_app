class UserProduceController < ApplicationController

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
  
  def create
    @user_produce = UserProduce.new(produce_id: params[:format])
    @user_produce.user_id = current_user.id
    if @user_produce.save
      redirect_to user_path(current_user)
    else
      redirect_to produce_index_path
    end
  end

  def eaten
    @user_produce = UserProduce.find(params[:format])
    @user_produce.update_attributes(eaten?: true)
    @user_produce.save
    flash[:notice] = "Good for you! You ate your #{@user_produce.produce.name}!"
    redirect_to user_path(current_user)
  end

end
