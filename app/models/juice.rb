class Juice < ApplicationRecord
  has_many :juice_produce, dependent: :destroy
  has_many :produce, through: :juice_produce
  accepts_nested_attributes_for :produce
end
