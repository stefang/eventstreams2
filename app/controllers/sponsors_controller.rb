class SponsorsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    if on_subdomain?
      get_published_or_owned_event
      render :layout => 'event'
    else
      @event = current_user.owned_events.find(params[:event_id])
      @sponsors = @event.owned_sponsors.all
    end
  end

  def new
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.new
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    check_url
    @sponsor = @event.owned_sponsors.new(params[:sponsor])
    if @sponsor.save
      flash[:notice] = "Successfully created sponsor."
      redirect_to user_event_sponsors_path(current_user, @event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.find(params[:id])
  end
  
  def update
    @event = current_user.owned_events.find(params[:event_id])
    check_url
    @sponsor = @event.owned_sponsors.find(params[:id])
    if @sponsor.update_attributes(params[:sponsor])
      flash[:notice] = "Successfully updated sponsor."
      redirect_to user_event_sponsors_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @sponsor = @event.owned_sponsors.find(params[:id])
    @sponsor.destroy
    flash[:notice] = "Successfully destroyed sponsor."
    redirect_to user_event_sponsors_path(current_user, @event)
  end
  
  def check_url
    if !params[:sponsor][:url].blank? && !params[:sponsor][:url].match(/^http:\/\//i)
        params[:sponsor][:url] = "http:\/\/#{params[:sponsor][:url]}"
    end
  end
  
end
