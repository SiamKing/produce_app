class ProduceController < ApplicationController

  def index
    @fruit = Produce.fruit
    @veggies = Produce.veggie
  end

  def new
    @produce = Produce.new
  end

  def create
    @produce = Produce.new(produce_params)
    if @produce.save
      flash[:notice] = "You are quite the #{@produce.name} lover!"
      redirect_to @produce
    else
      render :new
    end
  end

  def show
    @produce = Produce.find(params[:id])
  end

  private

  def produce_params
    params.require(:produce).permit(:name, :image, :content, :expires_in, :content)
  end
end
