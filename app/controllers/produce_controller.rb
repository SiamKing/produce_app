class ProduceController < ApplicationController
  layout "site"
  include ProduceHelper
  before_action :logged_in?, except: :index

  def index
    index_helper(params)
  end

  def new
    @produce = Produce.new
  end

  def create
    @produce = Produce.new(produce_params)
    if @produce.save
      flash[:success] = "You are quite the #{@produce.name} lover!"
      redirect_to @produce
    else
      flash[:alert] = "Item was not saved. Please fill in all fields."
      render :new
    end
  end

  def show
    @produce = Produce.find(params[:id])
    @last_produce_id = Produce.last.id
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @produce }
    end
  end

  def edit
    @produce = Produce.find(params[:id])
  end

  def update
    @produce = Produce.find(params[:id])
    @produce.update_attributes(produce_params)
    if @produce.save
      flash[:success] = "#{@produce.name} was successfully edited"
      redirect_to @produce
    else
      flash[:alert] = "The item was not edited"
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
