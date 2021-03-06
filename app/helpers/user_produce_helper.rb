module UserProduceHelper

    def expires(prod)
      if prod.shelf_life > 1
        "Expires in #{prod.shelf_life} days"
      elsif prod.shelf_life == 1
        "Expires tomorrow!"
      elsif prod.shelf_life == 0
        "Eat me now!"
      else
        "I've gone bad :("
      end
    end

    def ate_or_throw_out(prod)
      if prod.shelf_life >= 0
        "I ate it!"
      else
        "I threw it out :("
      end
    end
end
