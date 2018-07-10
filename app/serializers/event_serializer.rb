class EventSerializer < ActiveModel::Serializer
  attributes :id,
  :event_name,
  :location_name,
  :address,
  :description,
  :date,
  :time,
  :duration,
  :friends,
  :host_id,
  :yelp_url,
  :maps_link,
  :yelp_image,
  :lat,
  :lon,
  :comments,
  :users

  has_many :user_events
  has_many :users, through: :user_events
  has_many :messages
  has_many :comments

end
