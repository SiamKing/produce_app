class Produce < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :user_produce
  has_many :users, through: :user_produce
  has_many :juice_produce, dependent: :destroy
  has_many :juices, through: :juice_produce
  before_save { self.name = name.titleize }
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :juices, :juice_produce

  def self.fruit
    self.where(kind: 'fruit').order(:name)
  end

  def self.veggies
    self.where(kind: 'veggie').order(:name)
  end

  def self.faves
    group(:id).order("count(produce.id) DESC").limit(6)
  end

  def self.sorted
    self.all.sort_by {|prod| prod.name}
  end
end
