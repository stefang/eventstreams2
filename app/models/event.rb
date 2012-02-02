class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :title, :subdomain, :start_date, :end_date, :published, :tagline, :description, :twitter_account, :twitter_hashtag, :google_analytics, :booking_url, :event_logo, :facebook_url

  has_attached_file :event_logo, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => "system/event_assets/:id/:attachment/:id/:style/:id.jpg",
    :url => ":id/:attachment/:id/:style/:id.jpg",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 92" 
    }  
  
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
  has_many :owned_venues, :class_name => 'Venue', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_links, :class_name => 'Link', :foreign_key => :event_id, :dependent => :destroy
  has_many :owned_tracks, :class_name => 'Track', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_speakers, :class_name => 'Speaker', :foreign_key => :event_id, :dependent => :destroy, :order => 'item_order'
  has_many :owned_talks, :class_name => 'Talk', :foreign_key => :event_id, :dependent => :destroy, :order => 'start ASC'
  has_many :owned_event_assets, :class_name => 'EventAsset', :foreign_key => :event_id, :dependent => :destroy
  has_many :menu_items, :class_name => 'EventMenu', :foreign_key => :event_id, :dependent => :destroy
  has_many :menu_order_main, :class_name => 'EventMenu', :foreign_key => :event_id, :conditions=>{:location => 'main'}, :order => 'item_order'
  has_many :menu_order_footer, :class_name => 'EventMenu', :foreign_key => :event_id, :conditions=>{:location => 'footer'}, :order => 'item_order'

  has_many :published_news_items, :class_name => 'EventNewsItem', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_date', :order => 'item_date DESC'
  has_many :published_event_pages, :class_name => 'EventPage', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_order'
  has_many :published_sponsors, :class_name => 'Sponsor', :foreign_key => :event_id, :conditions=>{:published => true, :sponsor_type => 'Sponsor'}, :order => 'item_order'
  has_many :published_venues, :class_name => 'Venue', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'item_order'
  has_many :published_links, :class_name => 'Link', :foreign_key => :event_id, :conditions=>{:published => true}
  has_many :published_talks, :class_name => 'Talk', :foreign_key => :event_id, :conditions=>{:published => true}, :order => 'start'
  
  def validate_subdomain
    if Event.count(:conditions => ["subdomain = ? and user_id != ?", subdomain, user_id]) > 0
      errors.add(:subdomain, "Someone has already bagged this subdomain, sorry!")
    end
  end
  
  def booking_url=(booking_url)
    write_attribute(:booking_url, validate_url(booking_url))
  end
  
  def facebook_url=(facebook_url)
    write_attribute(:facebook_url, validate_url(facebook_url))
  end
  
  def validate_url(url)
    if !url.blank? && !url.match(/^http|https:\/\//i)
      return "http:\/\/#{url}"
    else
      return url
    end 
  end 
  

end
