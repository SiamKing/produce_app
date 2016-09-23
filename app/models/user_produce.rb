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
end
