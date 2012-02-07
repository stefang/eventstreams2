class Link < ActiveRecord::Base
  attr_accessible :title, :url, :event_id, :published

  validates_presence_of :title, :on => :create
  validates_presence_of :url, :on => :create
  validates_presence_of :event_id, :on => :create

  scope :published, where(:published => true)


end
