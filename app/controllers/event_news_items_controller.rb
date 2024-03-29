class EventNewsItemsController < ApplicationController

  theme "default"
  layout :set_layout

  def index
    get_published_or_owned_event
    @news_items = @event.news_items.published.find(:all)
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end
  
  def show
    get_published_or_owned_event
    @news_item = @event.news_items.published.find(params[:id])
    render :locals => { 
      :event_logo_url_tiny => @event.event_logo.url(:tiny),
      :event_stylesheet_screen => current_theme_stylesheet_path('event'),
      :event_stylesheet_print => current_theme_stylesheet_path('print')
    }
  end
end
