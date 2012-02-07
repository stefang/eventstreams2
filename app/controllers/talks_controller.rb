class TalksController < ApplicationController

  layout :set_layout

  def index
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @talks = @event.talks.find(:all, :conditions => "published = true")
    end
  end
  
  def show
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @event_pages = @event.event_pages.published.find(:all, :conditions => "published = true")
      @talk = @event.talks.published.find(params[:id])
      @speakers = @talk.speakers.published.find(:all, :conditions => "published = true")
    end
  end

end
