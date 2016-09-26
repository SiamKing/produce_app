class Juice < ApplicationRecord
  has_many :juice_produce, dependent: :destroy
  has_many :produce, through: :juice_produce
  accepts_nested_attributes_for :juice_produce, reject_if: proc { |attributes| attributes[:quantity].blank?}
  accepts_nested_attributes_for :produce
  validates :name, presence: true

  def produce_attributes=(produce_attributes)
    produce_attributes.values.each do |produce_attribute|
      prod = Produce.find_or_create_by(produce_attribute)
      self.produce << prod
    end
  end

  # def juice_produce_attributes=(juice_produce_attributes)
  #   juice_produce_attributes.values.each do |jp_attributes|
  #     jp = JuiceProduce.
end
