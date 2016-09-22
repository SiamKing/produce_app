class UserProduceController < ApplicationController

  def create
    @user_produce = UserProduce.new(produce_id: params[:format])
    @user_produce.user_id = current_user.id
    if @user_produce.save
      redirect_to user_path(current_user)
    else
      redirect_to produce_index_path
    end
  end

end
