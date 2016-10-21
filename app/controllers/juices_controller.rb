class JuicesController < ApplicationController
  before_action :logged_in?
  include JuicesHelper

  def index
    juice_index_helper(params)
  end

  def new
    if params[:user_id].to_i == current_user.id
      @juice = Juice.new
      @produce = Produce.sorted
      @juice.produce.build
      @juice.juice_produce.build
    else
      flash[:alert] = "Hey! That's naughty! Stay on your own form!"
      redirect_to root_path
    end
  end

  def create
    juice_create_helper(params)
  end

  def show
    @juice = Juice.find(params[:id])
    @juice_produce = @juice.juice_produce
  end

  def edit
    @juice = Juice.find(params[:id])
    @produce_juice = @juice.produce
  end

  def update
    @juice = Juice.find(params[:id])
    @juice.update_attributes(juice_params(:name, :produce_attributes => [:id, :name, :juice_produce_attributes => :quantity]))
    if @juice.save
      flash[:success] = "Great success! #{@juice.name} has been edited!"
      redirect_to @juice
    else
      flash[:alert] = "Please add ingredients"
      redirect_to edit_juice_path(@juice)
    end
  end

  def destroy
    @juice = Juice.find(params[:id])
    if current_user.id == @juice.user_id
      @juice.destroy
      flash[:success] = "#{@juice.name} was successfully destroyed. That's good. Nobody liked it anyway!"
      redirect_to juices_path
    else
      flash[:alert] = "Sorry, you do not have permission to delete #{@juice.name}"
      redirect_to @juice
    end
  end

  private

  def juice_params(*args)
    params.require(:juice).permit(*args)
  end
end
