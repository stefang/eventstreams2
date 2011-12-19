class Sponsor < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :first_ten_words, :use => :scoped, :scope => :event
  
  attr_accessible :name, :slug, :event_id, :item_order, :published, :url, :sponsor_type, :logo

  has_attached_file :logo, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => ":rails_root/app/assets/event_assets/:event_id/:attachment/:id/:style/:id.jpg",
    :url => ":event_id/:attachment/:id/:style/:id.jpg",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 92" 
    }  
  
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :event_id
  
  def first_ten_words
    name.split(/\s+/)[0..9].compact.join(" ")
  end
  
  
end