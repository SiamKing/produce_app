class ProduceController < ApplicationController

  def index
    @produce_all = Produce.all
  end

  def new
    @produce = Produce.new
  end
end
