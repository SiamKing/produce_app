class Juice < ApplicationRecord
  has_many :juice_produce, dependent: :destroy
  has_many :produce, through: :juice_produce
  accepts_nested_attributes_for :produce, :juice_produce, reject_if: proc { |attributes| attributes[:quantity].blank?}
  #accepts_nested_attributes_for :produce
  validates :name, presence: true

  def produce_attributes=(produce_attributes)
    produce_attributes.values.each do |produce_attribute|
      skip if produce_attribute[:name].empty?
      if produce_attribute[:name].numeric?
        prod = Produce.create_by(name: produce_attribute.name)
        prod.juice_produce.create(quantity: produce_attribute[:juice_produce_attributes].values.first.quantity)
      else
        prod = Produce.find_by(produce_attribute.name)
        prod.juice_produce.create(quantity: produce_attribute[:juice_produce_attributes].values.first.quantity)
      end
      self.produce << prod
    end
  end

  # def juice_produce_attributes=(juice_produce_attributes)
  #   juice_produce_attributes.values.each do |jp_attributes|
  #     jp = JuiceProduce.
end
