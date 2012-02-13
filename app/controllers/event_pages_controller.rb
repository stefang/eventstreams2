class EventPagesController < ApplicationController
 
  theme "default"
  layout :set_layout

  def show
    get_published_or_owned_event
    @event_page = @event.event_pages.published.find(params[:id])
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end

end
