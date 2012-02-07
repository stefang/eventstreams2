class EventNewsItem < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event
  
  attr_accessible :headline, :content, :item_date, :event_id, :published
  
  validates_presence_of :headline, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :item_date, :on => :create
  
  scope :published, where(:published => true)
  default_scope order("item_date DESC")

  def first_ten_words
    headline.split(/\s+/)[0..9].compact.join(" ")
  end

end
