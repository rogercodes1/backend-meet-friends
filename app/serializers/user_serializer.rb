class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birthday, :gender, :avatar, :home_base, :initials

  has_many :user_events
  has_many :events, through: :user_events
  has_many :comments, through: :events
  has_many :messages, through: :events

end
