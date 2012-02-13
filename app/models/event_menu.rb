class EventMenu < ActiveRecord::Base
  attr_accessible :item_type, :item_id, :event_id, :item_order, :title, :url, :location, :custom_title
  
  validates_presence_of :item_id, :on => :create
  validates_presence_of :item_type, :on => :create
  validates_presence_of :event_id, :on => :create
  validates_presence_of :title, :on => :create
  validates_presence_of :url, :on => :create
  validates_presence_of :location, :on => :create
   
  # validates :item_id, :uniqueness => { :scope => [:item_type, :event_id, :location] }, :if => :is_static_item?

  default_scope order("item_order ASC")

  def display_title
    if custom_title.blank?
      title
    else
      custom_title
    end
  end
  
  def is_static_item?
    item_type == "static_item"
  end
  
  liquid_methods :display_title, :url
end