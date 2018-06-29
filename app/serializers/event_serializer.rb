class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_name, :location_name, :address, :description, :date, :time, :duration, :friends
end
