class Juice < ApplicationRecord
  has_many :produce_juices
  has_many :produce, through: :produce_juices
end
