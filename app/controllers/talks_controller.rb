class TalksController < ApplicationController
  
  theme 'default'
  layout :set_layout

  def index
    get_published_or_owned_event
    @talks = @event.talks.find(:all, :conditions => "published = true")
  end
  
  def show
    get_published_or_owned_event
    @event_pages = @event.event_pages.published.find(:all, :conditions => "published = true")
    @talk = @event.talks.published.find(params[:id])
    @speakers = @talk.speakers.published.find(:all, :conditions => "published = true")
  end

end
