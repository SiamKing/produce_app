class ProduceController < ApplicationController

  def index
    @produce_all = Produce.all
  end

  
end
