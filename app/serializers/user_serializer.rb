class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birthday, :gender, :avatar, :home_base, :initials, :comments, :events

  has_many :user_events
  has_many :events, through: :user_events
  has_many :comments
  has_many :messages

end
