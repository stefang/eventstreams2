class EventNewsItem < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :headline, :use => :scoped, :scope => :event
  
  attr_accessible :headline, :content, :item_date, :event_id, :published
  
  validates_presence_of :headline, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :item_date, :on => :create
end
