class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :event_id

  belongs_to :event

end
