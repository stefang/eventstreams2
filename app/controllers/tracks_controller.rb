class TracksController < ApplicationController

  theme 'default'
  layout :set_layout

  def index
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @talks = @event.talks.published.find(:all, :include => :track)
      @tracks = ActiveSupport::OrderedHash[@talks.group_by(&:track).sort_by{|track, track_talks| track.try(:item_order) || 1/0.0 }]
    end
  end
  
  def show
    get_published_or_owned_event
    if @event.blank?
      render_404
    else
      @track = @event.tracks.published.find(params[:id], :conditions => "published = true")
      render :layout => 'event'
    end
  end

end
