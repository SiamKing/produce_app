class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates_format_of :email, :with => /@/
  validates :email, length: { :minimum => 8 }
  has_many :user_produce
  has_many :produce, through: :user_produce
  has_many :juices

  def current_produce
    self.user_produce.where(eaten?: false)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def sorted
    self.juices.sort_by {|juice| juice.name}
  end

end
