class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_name,:location_name,:address,:description,:date,:time,:duration,:friends,:host_id,:yelp_url,:maps_link,:yelp_image
end
