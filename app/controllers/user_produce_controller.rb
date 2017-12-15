class UserProduceController < ApplicationController
  layout "site"
  before_action :logged_in?

  def show
    @user = current_user
    @user_produce = current_user.current_produce
    @fruit = @user_produce.sorted_fruit
    @veggies = @user_produce.sorted_veggies
  end

  def create
    @user_produce = UserProduce.new(produce_id: params[:format])
    @user_produce.user_id = current_user.id
    if @user_produce.save
      flash[:success] = "#{@user_produce.produce.name} have been added to your fridge"
      redirect_to user_produce_path(current_user)
    else
      flash[:alert] = "That was not succesful"
      redirect_to produce_index_path
    end
  end

  def eaten
    @user_produce = UserProduce.find(params[:format])
    @user_produce.update_attributes(eaten?: true)
    @user_produce.save
    flash[:success] = "Good for you! You ate your #{@user_produce.produce.name}!"
    redirect_to user_produce_path(current_user)
  end

end
