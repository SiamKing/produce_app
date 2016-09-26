class JuicesController < ApplicationController
  def new
    @juice = Juice.new
    @produce = Produce.all
    @juice.produce.build
    @juice.juice_produce.build
  end

  def create
    binding.pry
  end
end
