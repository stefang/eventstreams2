class Admin::LinksController < ApplicationController

  before_filter :authenticate_user!

  def new
    @event = current_user.events.find(params[:event_id])
    @link = @event.links.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    check_url
    @link = @event.links.new(params[:link])
    if @link.save
      create_event_menu_item @link
      flash[:notice] = "Successfully created link."
      redirect_to admin_event_event_pages_path(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @link = @event.links.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    check_url
    @link = @event.links.find(params[:id])
    if @link.update_attributes(params[:link])
      update_event_menu_item @link
      flash[:notice] = "Successfully updated link."
      redirect_to admin_event_event_pages_path(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @link = @event.links.find(params[:id])
    destroy_event_menu_item @link
    @link.destroy
    flash[:notice] = "Successfully deleted link."
    redirect_to admin_event_event_pages_path(@event)
  end
  
  def check_url
    if !params[:link][:url].blank? && !params[:link][:url].match(/^http:\/\//i)
        params[:link][:url] = "http:\/\/#{params[:link][:url]}"
    end
  end
  
end
