class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :juice_id, :created_at
  has_one :user
  has_one :juice
end
