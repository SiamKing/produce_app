class JuicesController < ApplicationController
  def new
    @juice = Juice.new
    # @produce_juices = @juice.produce_juices.build
    # @produce = @produce_juices.build_produce
  end
end
