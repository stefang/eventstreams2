class Venue < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :name, :use => :scoped, :scope => :event

  attr_accessible :name, :description, :address, :postcode, :latitude, :longitude, :website, :phone_number, :published, :event_id, :slug
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :postcode, :on => :create
  
end
