class EventsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show]
  before_filter :get_owned_event, :only => [:edit, :update, :destroy]
  skip_before_filter :enable_admin_side_menu, :only => [:index, :new, :create]
  
  def index
    if params[:user_id]
      @events = @user.owned_events.all
    else
      @events = Event.all(:conditions => "published = true")
    end
  end

  def show
    if on_subdomain?
      get_published_or_owned_event
      if @event.blank?
        render :layout => 'hidden_event', :action => 'hidden_event'
      else
        @latest_news = @event.published_news_items.find(:all)
        render :layout => 'event'
      end
    else
      @event = get_owned_event
    end
  end

  def new
    @event = @user.owned_events.new()
  end

  def create
    @event = @user.owned_events.new(params[:event])
    if @event.save
      redirect_to user_events_path(@user), :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to edit_user_event_path(@user, @event), :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to user_events_path(@user), :notice => "Successfully deleted event."
  end
  
  def get_owned_event
    @event = @user.owned_events.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:warning] = "Not authed"
      redirect_to '/'
  end
  
end
