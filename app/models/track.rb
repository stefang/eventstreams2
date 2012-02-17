class Track < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event
  
  has_many :talks, :class_name => 'Talk', :foreign_key => :track_id, :dependent => :destroy

  attr_accessible :title, :description, :event_id, :slug, :published, :item_order
  
  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
  
  scope :published, where(:published => true)
  default_scope order("item_order ASC")
  
  liquid_methods :title, :description, :talks, :dates

  def first_ten_words
    title.split(/\s+/)[0..9].compact.join(" ")
  end
  
  def dates
    # Turns array of talks [t1,...,tn] into [[date1,[t1,...]], [date2,[t2,...]]] into [date_talks1,date_talks2]
    # So that instead of dealing with a multi dimensional array we have an object that properly encapsulates what is stored
    self.talks.published.group_by(&:date).map{|date,talks| DateTalks.new date,talks }
  end
  
end
