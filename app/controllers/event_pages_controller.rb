class EventPagesController < ApplicationController
 
  layout :set_layout

  def show
    get_published_or_owned_event
    @event_page = @event.event_pages.published.find(params[:id])
  end

end
