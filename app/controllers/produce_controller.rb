class ProduceController < ApplicationController

  def index
    @produce_all = Produce.all
  end

  def new
    @produce = Produce.new
  end

  def create
    @produce = Produce.new(produce_params)
    if @produce.save
      redirect_to @produce
    else
      render :new
    end

    def show
      @produce = Produce.find(params[:id])
    end
  end


  private

  def private_params
    params.require(:produce).permit(:name, :image, :content, :expires_in, :content)
  end
end
