class EventPage < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event
  
  attr_accessible :title, :content, :event_id, :published, :slug
  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create

  
  def first_ten_words
    title.split(/\s+/)[0..9].compact.join(" ")
  end
end
