module UserProduceHelper

    def expires(prod)
      if prod.shelf_life > 1
        "Expires in #{prod.shelf_life} days"
      elsif self.shelf_life == 1
        "Expires tomorrow!"
      elsif prod.shelf_life == 0
        "Eat me now!"
      else
        "I've gone bad:("
      end
    end
end
