class JuicesController < ApplicationController

  def index
    if params[:user_id]
      @juices = User.find(params[:user_id]).juices
    else
      @juices = Juice.all
    end
  end    

  def new
    @juice = Juice.new
    @produce = Produce.all.sort_by {|prod| prod.name}
    @juice.produce.build
    @juice.juice_produce.build
  end

  def create
    @juice = Juice.new(juice_params(:name))
    if @juice.save
      @juice.user_id = current_user.id
      @juice.update_attributes(juice_params(:produce_attributes => [:name, :juice_produce_attributes => :quantity]))
      if @juice.save
        redirect_to @juice
      else
        flash[:alert] = "Please add ingredients"
        redirect_to new_juice_path(@juice)
      end
    else
      flash[:alert] = "Please name the juice and add ingredients"
      redirect_to new_juice_path(@juice)
    end
  end

  def show
    binding.pry
    @juice = Juice.find(params[:id])
    @juice_produce = @juice.juice_produce
  end

  def edit
    @juice = Juice.find(params[:id])
    # @produce = Produce.all
    @produce_juice = @juice.produce
    # @juice.produce.build
    # @juice.juice_produce.build
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

  private

  def juice_params(*args)
    params.require(:juice).permit(*args)
  end
end
