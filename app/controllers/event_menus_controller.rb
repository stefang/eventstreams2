class EventMenusController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event = current_user.owned_events.find(params[:event_id])
    @event_menus_main =  @event.menu_order_main.all
    @event_menus_footer = @event.menu_order_footer.all
    @active_items = []
    unless @event_menus_main.blank?
      @event_menus_main.each do |i|
        puts i.item_type
        if i.item_type == 'static_item'
          @active_items << "#{i.item_type.tableize}_#{i.title.downcase}"
        else
          @active_items << "#{i.item_type.tableize}_#{i.item_id}"
        end
      end  
      puts @active_items
    end
    
    unless @event_menus_footer.blank?
      @event_menus_footer.each do |i|
        if i.item_type == 'static_item'
          @active_items << "#{i.item_type.tableize}_#{i.title.downcase}"
        else
          @active_items << "#{i.item_type.tableize}_#{i.item_id}"
        end
      end  
    end
  end
  
  def create
    @event = current_user.owned_events.find(params[:event_id])
    @item = @event.menu_items.new(params)
    if @item.save
      render :text => @item.id
    else
      render :text => "false"
    end
  end

  def update   
    @event = current_user.owned_events.find(params[:event_id])
    @menu_item = @event.menu_items.find(params[:id])
    @menu_item.custom_title = params[:custom_title]
    if @menu_item.save
      render :text => "Title updated"
    else
      render :text => "Title save failed"
    end
  end
  
  def destroy
    @event = current_user.owned_events.find(params[:event_id])
    @menu_item = @event.menu_items.find(params[:id])
    if @menu_item.destroy
      render :text => "Menu item deleted"
    else
      render :text => "false"
    end
  end
    
  def update_order
    current_item = 1
    item_order = params[:item_order].split("&")
    item_order.each do |e|
      item = EventMenu.find(e.split("=")[1])
      item.item_order = current_item
      item.save
      current_item += 1
    end
    render :text => "Menu order saved"
  end
end
