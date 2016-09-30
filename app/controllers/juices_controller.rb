class JuicesController < ApplicationController

  def index
    @juices = Juice.all
  end

  def new
    @juice = Juice.new
    @produce = Produce.all
    @juice.produce.build
    @juice.juice_produce.build
  end

  def create
    @juice = Juice.new(juice_params(:name))
    if @juice.produce_attributes?(params[:juice][:produce_attributes]) && @juice.save
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
    binding.pry
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
#:name, :produce_attributes => [:name, :juice_produce_attributes => :quantity]
