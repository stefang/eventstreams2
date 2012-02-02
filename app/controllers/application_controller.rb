# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :define_at_user
  before_filter :enable_admin_side_menu
  protect_from_forgery
  
  def define_at_user
    @user = current_user
  end
  
  def on_subdomain?
    request.subdomain(SUBDOMAIN_LEVEL).present? && request.subdomain(SUBDOMAIN_LEVEL) != 'www'
  end
  
  def enable_admin_side_menu
    @enable_admin_side_menu = true
  end
  
  def get_published_or_owned_event
    if signed_in? && current_user.superadmin?
      @event = Event.find_by_subdomain(request.subdomain(SUBDOMAIN_LEVEL), :order => 'start_date DESC', :limit => 1)
    elsif signed_in?
      @event = Event.find_by_subdomain(request.subdomain(SUBDOMAIN_LEVEL), :conditions => "published = true OR user_id = #{current_user.id}", :order => 'start_date DESC', :limit => 1)
    else
      @event = Event.find_by_subdomain(request.subdomain(SUBDOMAIN_LEVEL), :conditions => "published = true", :order => 'start_date DESC', :limit => 1)
    end
  end
  
  def create_event_menu_item(item)
  end
  
  def update_event_menu_item(item)
    if @menu_item = EventMenu.where(:item_type => item.class, :event_id => item.event_id, :item_id => item.id).first    
      @menu_item.title = item.title
      if @menu_item.item_type == 'Link'
        @menu_item.url = item.url
      else
        @menu_item.url = url_for :controller => @menu_item.item_type.tableize, :action => 'show', :id => item.slug, :only_path => true
      end
      @menu_item.save
    end
  end
  
  def destroy_event_menu_item(item)
    @menu_item.destroy if @menu_item = EventMenu.where(:item_type => item.class, :event_id => item.event_id, :item_id => item.id).first
  end
    
end
