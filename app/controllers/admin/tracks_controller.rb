class Admin::TracksController < ApplicationController

  before_filter :authenticate_user!
    
  def index
    @event = current_user.events.find(params[:event_id])
    @tracks = @event.tracks.all
  end
  
  def new
    @event = current_user.events.find(params[:event_id])
    @track = @event.tracks.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    @track = Track.new(params[:track])
    @track.event_id = @event.id
    if @track.save
      flash[:notice] = "Successfully created track."
      redirect_to admin_event_tracks_path(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @track = Track.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      flash[:notice] = "Successfully updated track."
      redirect_to admin_event_tracks_path(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @track = Track.find(params[:id])
    @track.destroy
    flash[:notice] = "Successfully deleted track."
    redirect_to admin_event_tracks_path(@event)
  end
  
  def update_order
    current_item = 1
    puts params
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Track.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Track order saved"
  end
  
end
