class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :title, :subdomain, :start_date, :end_date, :published, :tagline, :description, :twitter_account, :twitter_hashtag, :google_analytics, :booking_url

  validates_presence_of :title
  validates_presence_of :subdomain
  validate :validate_subdomain  
  validates_exclusion_of :subdomain, :in => %w(www about contact faq blog tour features packages tos privacy help support pricing careers assets staging edge),
      :message => "'%{value}' is reserved."
  validates_format_of :subdomain, :with => /^\w+$/i, :message => "must only contain letters and numbers"
  validates_format_of :twitter_hashtag, :with => /^#/i, :message => "requires a # at the start", :allow_blank => true
  validates_format_of :twitter_account, :with => /^@/i, :message => "should have an @ at the start", :allow_blank => true
  
  has_many :owned_news_items, :class_name => 'EventNewsItem', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_date DESC'
  has_many :owned_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_sponsors, :class_name => 'Sponsor', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'

  has_many :published_news_items, :class_name => 'EventNewsItem', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_date', :order => 'item_date DESC'
  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_order'
  has_many :published_sponsors, :class_name => 'Sponsor', :foreign_key => :event_id, :conditions=>{:published => true, :sponsor_type => 'Sponsor'}, :order => 'item_order'
  
  def validate_subdomain
    if Event.count(:conditions => ["subdomain = ? and user_id != ?", subdomain, user_id]) > 0
      errors.add(:subdomain, "Someone has already bagged this subdomain, sorry!")
    end
  end

end
