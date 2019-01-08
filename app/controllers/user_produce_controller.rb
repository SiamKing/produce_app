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
    @user_produce = UserProduce.new(produce_id: params[:id])
    @user_produce.user_id = current_user.id
    if @user_produce.save
      flash[:success] = "#{@user_produce.produce.name} have been added to your fridge" 
      render "create.js.erb"
    else
      flash[:alert] = "Item was not added. Please try again."
      redirect_to produce_index_path
    end
  end

  def update
    @user_produce = UserProduce.find(params[:id])
    @user_produce.update_attributes(eaten?: true)
    if @user_produce.save
      flash[:success] = "Good for you! You ate your #{@user_produce.produce.name}!"
      render "update.js.erb", layout: false, content_type: 'text/javascript'
      # render :json => @user_produce
    else
      flash[:alert] = "Whoops. That didn't work. Please try again."
      redirect_to user_produce_path(current_user)
    end
  end

end
