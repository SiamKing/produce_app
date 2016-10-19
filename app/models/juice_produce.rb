class JuiceProduce < ApplicationRecord
  belongs_to :produce
  belongs_to :juice
  accepts_nested_attributes_for :juice
  accepts_nested_attributes_for :produce
  validates :quantity, presence: true
  delegate :name, to: :juice, prefix: true
  #validates :produce_id, uniqueness: { scope: :juice_id }

end
