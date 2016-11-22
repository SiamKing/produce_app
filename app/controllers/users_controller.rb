class UsersController < ApplicationController
  before_action :logged_in?

  def show
    # respond_to do |f|
    #   f.html { render :show }
    #   f.json { render json: current_user.juices }
    # end
  end

  def index
    @users = User.all
  end

end
