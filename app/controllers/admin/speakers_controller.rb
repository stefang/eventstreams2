class Admin::SpeakersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @event = current_user.events.find(params[:event_id])
    @speakers = @event.speakers.all
  end
  
  def new
    @event = current_user.events.find(params[:event_id])
    @speaker = @event.speakers.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    @speaker = Speaker.new(params[:speaker])
    @speaker.event_id = @event.id
    if @speaker.save
      flash[:notice] = "Successfully created speaker."
      redirect_to admin_event_speakers_url(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @speaker = @event.speakers.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    @speaker = @event.speakers.find(params[:id])
    if @speaker.update_attributes(params[:speaker])
      flash[:notice] = "Successfully updated speaker."
      redirect_to admin_event_speakers_url(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    flash[:notice] = "Successfully deleted speaker."
    redirect_to admin_event_speakers_url(@event)
  end
  
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = Speaker.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Speaker order saved"
  end
  
end
