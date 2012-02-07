class Admin::EventAssetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @event = current_user.events.find(params[:event_id])
    @event_assets = @event.event_assets.all
  end
  
  def new
    @event = current_user.events.find(params[:event_id])
    @event_asset = @event.event_assets.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    @event_asset = EventAsset.new(params[:event_asset])
    @event_asset.event_id = @event.id
    if @event_asset.save
      flash[:notice] = "Successfully created event asset."
      redirect_to admin_event_event_assets_path(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @event_asset = @event.event_assets.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    @event_asset = @event.event_assets.find(params[:id])
    if @event_asset.update_attributes(params[:event_asset])
      flash[:notice] = "Successfully updated event asset."
      redirect_to admin_event_event_assets_path(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @event_asset = @event.event_assets.find(params[:id])
    @event_asset.destroy
    flash[:notice] = "Successfully deleted event asset."
    redirect_to admin_event_event_assets_path(@event)
  end
end
