class JuicesController < ApplicationController
  def new
    @juice = Juice.new
    @produce = Produce.all
    @juice.produce.build
    @juice.juice_produce.build
  end

  def create
    @juice = Juice.create(juice_params(:name))
    @juice.update_attributes(juice_params(:produce_attributes => [:name, :juice_produce_attributes => :quantity]))
    if @juice.save
      redirect_to @juice
    else
      render :new
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
