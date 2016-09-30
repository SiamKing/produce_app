class Produce < ApplicationRecord
  validates :name, uniqueness: true
  has_many :produce_items
  has_many :users, through: :produce_items
  has_many :juice_produce, dependent: :destroy
  has_many :juices, through: :juice_produce
  before_save { self.name = name.titleize }
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :juices, :juice_produce

  def self.fruit
    self.where(kind: 'fruit')
  end

  def self.veggie
    self.where(kind: 'veggie')
  end

end
