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
    if @juice.produce_attributes?(juice_params(:produce_attributes => [:name, :juice_produce_attributes => :quantity])) && @juice.save
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
    @produce = @juice.produce
  end

  private

  def juice_params(*args)
    params.require(:juice).permit(*args)
  end
end
#:name, :produce_attributes => [:name, :juice_produce_attributes => :quantity]
