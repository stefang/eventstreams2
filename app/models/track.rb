class Track < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :title, :use => :scoped, :scope => :event
  
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :track_id, :dependent => :destroy

  attr_accessible :title, :description, :event_id, :slug, :published, :item_order
  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
end
