class ProduceController < ApplicationController

  def index
    @fruit = Produce.fruit.order(:name)
    @veggies = Produce.veggie.order(:name)
  end

  def new
    @produce = Produce.new
    @submit = "Create Produce"
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

  def edit
    @produce = Produce.find(params[:id])
    @submit = "Edit Produce"
  end

  def update
    @produce = Produce.find(params[:id])
    @produce.update_attributes(produce_params)
    if @produce.save
      redirect_to @produce
    else
      render :edit
    end
  end

  private

  def produce_params
    params.require(:produce).permit(:name, :image, :kind, :content, :expires_in, :content)
  end
end
