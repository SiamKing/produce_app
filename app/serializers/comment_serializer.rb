class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :juice_id
  has_one :user
  has_one :juice
end
