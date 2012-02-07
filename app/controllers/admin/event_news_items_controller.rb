class Admin::EventNewsItemsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @event = current_user.events.find(params[:event_id])
    @event_news_items = @event.news_items.all
  end
  
  def new
    @event = current_user.events.find(params[:event_id])
    @event_news_item = @event.news_items.new
  end
  
  def create
    @event = current_user.events.find(params[:event_id])
    @event_news_item = @event.news_items.new(params[:event_news_item])
    if @event_news_item.save
      flash[:notice] = "Successfully created event news item."
      redirect_to admin_event_event_news_items_path(@event)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = current_user.events.find(params[:event_id])
    @event_news_item = @event.news_items.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:event_id])
    @event_news_item = @event.news_items.find(params[:id])
    if @event_news_item.update_attributes(params[:event_news_item])
      flash[:notice] = "Successfully updated event news item."
      redirect_to admin_event_event_news_items_path(@event)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @event_news_item = @event.news_items.find(params[:id])
    @event_news_item.destroy
    flash[:notice] = "Successfully deleted event news item."
    redirect_to admin_event_event_news_items_path(@event)
  end
end
