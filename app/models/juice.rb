class Juice < ApplicationRecord
  has_many :juice_produce, dependent: :destroy
  has_many :produce, through: :juice_produce
  #accepts_nested_attributes_for :produce, :juice_produce, reject_if: proc { |attributes| attributes[:quantity].blank? }, allow_destroy: true
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates_associated :produce

  def produce_attributes=(produce_attributes)
    produce_attributes.values.each do |produce_attribute|
      if !produce_attribute[:name].empty?
        if produce_attribute[:name].numeric?
          prod = Produce.find(produce_attribute[:name])
        else
          prod = Produce.find_or_create_by(name: produce_attribute[:name])
        end
        if !produce_attribute[:juice_produce_attributes].values.first[:quantity].empty?
          juice_prod = self.juice_produce.find_or_create_by(produce_id: prod.id)
          juice_prod.quantity =  produce_attribute[:juice_produce_attributes].values.first[:quantity]
          binding.pry
          juice_prod.save!
        end
      end
    end
  end

  def produce_attributes?(produce_attributes)
    pa = ""
    produce_attributes.values.each do |produce_attribute|
      pa << produce_attribute[:name]
    end
    !pa.empty?
  end

end
