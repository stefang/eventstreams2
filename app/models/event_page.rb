class EventPage < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :title, :use => :scoped, :scope => :event
  
  attr_accessible :title, :content, :event_id, :published, :slug, :item_order
  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
  
end
