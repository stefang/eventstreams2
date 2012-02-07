class Admin::TalksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @event = current_user.events.find(params[:event_id])
    @talks = @event.talks.find(:all, :order => "start")
  end
  
  def new
    @event = current_user.events.find(params[:event_id])
    @venues = @event.venues.all
    @tracks = @event.tracks.all
    @speakers = @event.speakers.all
    @talk = Talk.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    @speakers = @event.speakers.all
    @tracks = @event.tracks.all
    @talk = Talk.new(params[:talk])
    @talk.start = "#{params[:start_date]} #{params[:start_hour]}:#{params[:start_min]}"
    @talk.event_id = @event.id
    if @talk.save
      flash[:notice] = "Successfully created talk."
      redirect_to admin_event_talks_path(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @venues = @event.venues.all
    @tracks = @event.tracks.all
    @speakers = @event.speakers.all
    @talk = @event.talks.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    @speakers = @event.speakers.all
    @talk = @event.talks.find(params[:id])
    params[:talk][:start] = "#{params[:start_date]} #{params[:start_hour]}:#{params[:start_min]}"
    if @talk.update_attributes(params[:talk])
      flash[:notice] = "Successfully updated talk."
      redirect_to admin_event_talks_path(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @talk = @event.talks.find(params[:id])
    @talk.destroy
    flash[:notice] = "Successfully deleted talk."
    redirect_to admin_event_talks_path(@event)
  end
end
