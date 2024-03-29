class Speaker < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  has_and_belongs_to_many :talks
  friendly_id :first_ten_words, :use => :scoped, :scope => :event

  attr_accessible :name, :biog, :event_id, :published, :slug, :portrait, :item_order

  has_attached_file :portrait, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => ":rails_root/public/system/event_assets/:event_id/:attachment/:id/:style/:id.jpg",
    :url => "/system/event_assets/:event_id/:attachment/:id/:style/:id.jpg",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 92" 
  }  

  scope :published, where(:published => true)
  default_scope order("item_order ASC")
  
  validates_presence_of :name, :on => :create
  validates_presence_of :event_id, :on => :create
  
  liquid_methods :name, :url, :talks
  
  def url
    "#{Rails.application.routes.url_helpers.speakers_path}/#{slug}"
  end
   
  def first_ten_words
    name.split(/\s+/)[0..9].compact.join(" ")
  end
    
end
