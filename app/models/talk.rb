class Talk < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :scoped, :scope => :event

  attr_accessible :title, :description, :event_id, :slug, :published, :item_order
  
  belongs_to :track
  belongs_to :venue
  belongs_to :event
  has_and_belongs_to_many :speakers
  
  validates_presence_of :title
  
  scope :published, where(:published => true)
end