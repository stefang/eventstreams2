class TalksController < ApplicationController
  
  theme 'default'
  layout :set_layout

  def index
    get_published_or_owned_event
    @talks = @event.talks.find(:all, :conditions => "published = true")
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end
  
  def show
    get_published_or_owned_event
    @talk = @event.talks.published.find(params[:id])
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end

end
