class VenuesController < ApplicationController

  layout :set_layout

  def index
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @venues = @event.venues.published.all
    end
  end
  
  def show
    get_published_or_owned_event
    @venue = @event.venues.published.find(params[:id])
  end
  
end
