class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :comments, through: :events
  has_many :messages, through: :events
end
