class ProduceSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :image, :expires_in
end
