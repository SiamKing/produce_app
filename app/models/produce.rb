class Produce < ApplicationRecord
  validates :name, uniqueness: true
  has_many :produce_items
  has_many :users, through: :produce_items
  mount_uploader :image, ImageUploader

  def self.fruit
    self.where(kind: 'fruit')
  end

  def self.veggie
    self.where(kind: 'veggie')
  end


end
