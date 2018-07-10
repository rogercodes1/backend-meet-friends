class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :event_id, :user_id, :created_at

  belongs_to :event
  belongs_to :user
end
