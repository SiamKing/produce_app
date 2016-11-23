class JuiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_one :user
  has_many :juice_produce
  has_many :produce
end
