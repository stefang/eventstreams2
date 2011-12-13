class EventPagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    if on_subdomain?
      get_published_or_owned_event
      @event_pages = @event.owned_event_pages.find(:all, :conditions => "published = true")
      render :layout => 'event'
    else
      @event = current_user.owned_events.find(params[:event_id])
      @event_pages = @event.owned_event_pages.all
      @links = @event.owned_links.all
    end
  end

  def show
    get_published_or_owned_event
    @event_page = @event.owned_event_pages.find(params[:id], :conditions => "published = true")
    render :layout => 'event'
  end

  def new
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = @event.owned_event_pages.new
  end

  def create
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = EventPage.new(params[:event_page])
    @event_page.event_id = @event.id
    if @event_page.save
      # create_event_menu_item @event_page
      flash[:notice] = "Successfully created event page."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'new'
    end
  end

  def edit
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = @event.owned_event_pages.find(params[:id])
  end

  def update
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = EventPage.find(params[:id])
    if @event_page.update_attributes(params[:event_page])
      # update_event_menu_item @event_page
      flash[:notice] = "Successfully updated event page."
      redirect_to user_event_event_pages_path(current_user, @event)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @event_page = EventPage.find(params[:id])
    #destroy_event_menu_item @event_page
    @event_page.destroy
    flash[:notice] = "Successfully destroyed event page."
    redirect_to user_event_event_pages_path(current_user, @event)
  end
end
