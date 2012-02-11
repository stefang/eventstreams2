class EventsController < ApplicationController
  # theme "default"
  def show
    get_published_or_owned_event
    if @event.blank?
      render :layout => 'hidden_event', :action => 'hidden_event'
    else
      render :layout => 'event'
    end
  end
end