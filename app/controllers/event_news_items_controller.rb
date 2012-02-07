class EventNewsItemsController < ApplicationController

  layout :set_layout

  def index
    get_published_or_owned_event
    @event_news_items = @event.news_items.published.find(:all)
  end
  
  def show
    get_published_or_owned_event
    @event_news_item = @event.news_items.published.find(params[:id])
  end
end
