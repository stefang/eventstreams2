class SpeakersController < ApplicationController

  layout :set_layout

  def index
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @speakers = @event.speakers.published.find(:all)
    end
  end
  
  def show
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @speaker = @event.speakers.published.find(params[:id])
    end
  end
  
end
