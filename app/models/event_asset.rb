class EventAsset < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event

  attr_accessible :title, :event_id, :asset
  
  has_attached_file :asset, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => ":rails_root/public/system/event_assets/:event_id/:attachment/:id/:style/:basename.:extension",
    :url => "/system/event_assets/:event_id/:attachment/:id/:style/:basename.:extension",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 92" 
    }  

  validates_presence_of :title, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_attachment_presence :asset
  
  def first_ten_words
    title.split(/\s+/)[0..9].compact.join(" ")
  end
  
end
