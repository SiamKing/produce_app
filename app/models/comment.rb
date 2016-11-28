class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :juice
  validates :content, :user_id, :juice_id, presence: true
end
