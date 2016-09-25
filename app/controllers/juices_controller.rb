class JuicesController < ApplicationController
  def new
    @juice = Juice.new
    @juice.produce.build
    @juice.juice_produce.build
  end
end
