class Produce < ApplicationRecord

  has_many :produce_items
  has_many :users, through: :produce_items
  
end
