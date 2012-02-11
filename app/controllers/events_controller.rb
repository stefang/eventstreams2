class EventsController < ApplicationController

  theme "default"
  layout :set_layout

  def show
    get_published_or_owned_event
    if @event.blank?
      render :layout => 'hidden_event', :action => 'hidden_event'
    end
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end
end