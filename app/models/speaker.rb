class Speaker < ActiveRecord::Base
  extend FriendlyId
  belongs_to :event
  has_and_belongs_to_many :talks
  friendly_id :name, :use => :scoped, :scope => :event

  attr_accessible :name, :biog, :event_id, :published, :slug, :portrait, :item_order

  has_attached_file :portrait, :styles => { :original => "980x980", :medium => "460x300>", :thumb => "210x90>", :tiny => "42x42#" }, 
    :path => ":rails_root/app/assets/event_assets/:event_id/:attachment/:id/:style/:id.jpg",
    :url => ":event_id/:attachment/:id/:style/:id.jpg",
    :convert_options => {
         :all => "-strip -colorspace RGB", 
         :thumb => "-quality 92" 
    }  

    validates_presence_of :name, :on => :create
    validates_presence_of :event_id, :on => :create
end
