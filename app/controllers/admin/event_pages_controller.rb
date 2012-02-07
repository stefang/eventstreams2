class Admin::EventPagesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @event = current_user.events.find(params[:event_id])
    @event_pages = @event.event_pages.all
    @links = @event.links.all
  end

  def new
    @event = current_user.events.find(params[:event_id])
    @event_page = @event.event_pages.new
  end

  def create
    @event = current_user.events.find(params[:event_id])
    @event_page = EventPage.new(params[:event_page])
    @event_page.event_id = @event.id
    if @event_page.save
      create_event_menu_item @event_page
      flash[:notice] = "Successfully created event page."
      redirect_to admin_event_event_pages_path(@event)
    else
      render :action => 'new'
    end
  end

  def edit
    @event = current_user.events.find(params[:event_id])
    @event_page = @event.event_pages.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:event_id])
    @event_page = EventPage.find(params[:id])
    if @event_page.update_attributes(params[:event_page])
      update_event_menu_item @event_page
      flash[:notice] = "Successfully updated event page."
      redirect_to admin_event_event_pages_path(@event)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = current_user.events.find(params[:event_id])
    @event_page = EventPage.find(params[:id])
    destroy_event_menu_item @event_page
    @event_page.destroy
    flash[:notice] = "Successfully deleted event page."
    redirect_to admin_event_event_pages_path(@event)
  end
end
