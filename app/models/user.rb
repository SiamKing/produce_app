class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates :email, length: { :minimum => 8 }
  has_many :user_produce
  has_many :produce, through: :user_produce
end
