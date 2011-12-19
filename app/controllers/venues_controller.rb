class VenuesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    if on_subdomain?
      get_published_or_owned_event
      if @event.blank?
        render_404
      else
        @venues = @event.owned_venues.all
        render :layout => 'event'
      end
    else
      @event = current_user.owned_events.find(params[:event_id])
      @venues = @event.owned_venues.all
    end
  end
  
  def show
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id])
  end
  
  def new
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.new(params[:venue])
    @venue.event_id = @event.id
    
    if @venue.save
      flash[:notice] = "Successfully created venue."
      redirect_to user_event_venues_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    @venue = @event.owned_venues.find(params[:id])
    if @venue.update_attributes(params[:venue])
      flash[:notice] = "Successfully updated venue."
      redirect_to user_event_venues_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Successfully deleted venue."
    redirect_to user_event_venues_path
  end
  
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Venue.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Venue order saved"
  end
  
end
