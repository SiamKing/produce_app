module ProduceHelper

  def index_helper(params)
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
  
end
