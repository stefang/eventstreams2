class Venue < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event

  attr_accessible :name, :description, :address, :postcode, :latitude, :longitude, :website, :phone_number, :published, :event_id, :slug, :item_order
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :postcode, :on => :create
  
  scope :published, where(:published => true)
  default_scope order("item_order ASC")
  
  def first_ten_words
    name.split(/\s+/)[0..9].compact.join(" ")
  end
  
end
