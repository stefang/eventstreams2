class Admin::EventsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :get_owned_event, :only => [:show, :edit, :update, :destroy]
  skip_before_filter :enable_admin_side_menu, :only => [:index, :new, :create]
  
  def index
    @events = @user.events.all
  end

  def new
    @event = @user.events.new()
  end

  def create
    @event = @user.events.new(params[:event])
    if @event.save
      redirect_to admin_events_path, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to edit_admin_event_path(@event), :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path, :notice => "Successfully deleted event."
  end
  
  def get_owned_event
    @event = @user.events.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:warning] = "Not authed"
      redirect_to '/'
  end

end
