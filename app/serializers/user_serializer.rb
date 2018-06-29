class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birthday, :gender

  has_many :user_events
  has_many :events, through: :user_events
  
end
