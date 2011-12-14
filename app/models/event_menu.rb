class EventMenu < ActiveRecord::Base
  attr_accessible :item_type, :item_id, :event_id, :item_order, :title, :url, :location
end
