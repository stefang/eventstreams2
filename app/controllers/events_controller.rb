class EventsController < ApplicationController
  def show
    get_published_or_owned_event
    if @event.blank?
      render :layout => 'hidden_event', :action => 'hidden_event'
    else
      @latest_news = @event.news_items.published.find(:all)
      render :layout => 'event'
    end
  end
end