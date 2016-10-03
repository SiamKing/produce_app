class ProduceController < ApplicationController

  def index
    binding.pry
    if params[:id]
      @fruit = User.find(params[:id]).produce.fruit.faves
      @veggies = User.find(params[:id]).produce.veggies.faves
      @produce_jumbo = "#{current_user.name}'s Faves"
    else
      @fruit = Produce.fruit
      @veggies = Produce.veggies
      @produce_jumbo = "Fresh Produce"
    end
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

  def edit
    @produce = Produce.find(params[:id])
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

  def destroy
    @produce = Produce.find(params[:id])
    @produce.destroy
    flash[:success] = "#{@produce.name} was deleted"
    redirect_to produce_index_path
  end

  private

  def produce_params
    params.require(:produce).permit(:name, :image, :kind, :content, :expires_in, :content)
  end
end
