class Juice < ApplicationRecord
  has_many :juice_produce, dependent: :destroy
  has_many :produce, through: :juice_produce
  #accepts_nested_attributes_for :juice_produce, reject_if: proc { |attributes| attributes[:quantity].blank? }
  #accepts_nested_attributes_for :produce, reject_if: proc { |attributes| attributes[:name].blank? }
  validates :name, presence: true
  validates :name, uniqueness: true

  def produce_attributes=(produce_attributes)
    produce_attributes.values.each do |produce_attribute|
      if !produce_attribute[:name].empty?
        if produce_attribute[:name].numeric?
          prod = Produce.find(produce_attribute[:name])
        else
          prod = Produce.find_or_create_by(name: produce_attribute[:name])
        end
        prod.juice_produce.create(juice_id: self.id, quantity: produce_attribute[:juice_produce_attributes].values.first[:quantity])
      end
    end
  end

end
