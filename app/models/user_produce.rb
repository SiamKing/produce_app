class UserProduce < ApplicationRecord

  belongs_to :user
  belongs_to :produce

  def shelf_life
    self.produce.expires_in - ((Time.now.to_i - self.created_at.to_i) / 86400)
  end

  def self.user_fruit
    self.select do |user_pro|
      user_pro.produce.kind == 'fruit'
    end
  end

  def self.user_veggies
    self.select do |user_pro|
      user_pro.produce.kind == 'veggie'
    end
  end

  def self.juices_from_fridge
    self.all.collect do |prod|
      prod.produce.juices
    end.uniq
  end

  def self.sorted_fruit
    self.user_fruit.sort_by {|prod| prod.shelf_life}
  end

  def self.sorted_veggies
    self.user_veggies.sort_by {|prod| prod.shelf_life}
  end

end
