class Sponsor < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  friendly_id :name, :use => :scoped, :scope => :event
  
  attr_accessible :name, :slug, :event_id, :item_order, :published, :logo_file_name, :logo_content_type, :logo_file_size, :logo_updated_at, :url, :sponsor_type, :logo

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
  
end