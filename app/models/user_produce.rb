class UserProduce < ApplicationRecord

  belongs_to :user
  belongs_to :produce

  def shelf_life
    self.produce.expires_in - ((Time.now.to_i - self.created_at.to_i) / 86400)
  end

end
