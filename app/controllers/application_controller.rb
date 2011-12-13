# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :define_at_user
  protect_from_forgery
  
  def define_at_user
    @user = current_user
  end
  
  def get_published_or_owned_event
    if signed_in? && current_user.superadmin?
      @event = Event.find_by_subdomain(request.subdomain, :order => 'start_date DESC', :limit => 1)
    elsif signed_in?
      @event = Event.find_by_subdomain(request.subdomain, :conditions => "published = true OR user_id = #{current_user.id}", :order => 'start_date DESC', :limit => 1)
    else
      @event = Event.find_by_subdomain(request.subdomain, :conditions => "published = true", :order => 'start_date DESC', :limit => 1)
    end
  end
     
end
