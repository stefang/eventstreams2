Given /^an event exists called "(.*)"$/ do |event_name|
  @event = Factory :event, :title => event_name, :subdomain => event_name, :user_id => 100
end

Given /^a hidden event exists called "(.*)"$/ do |event_name|
  @event = Factory :event, :title => event_name, :subdomain => event_name, :user_id => 100, :published => false
end

Given /^I have an event called "(.*)"$/ do |event_name|
  @event = Factory :event, :title => event_name, :subdomain => event_name, :user_id => @user.id
end

Given /^I have a hidden event called "(.*)"$/ do |event_name|
  @event = Factory :event, :title => event_name, :subdomain => event_name, :published => false, :user_id => @user.id
end

Given /^"(.*)" has a programme menu item$/ do |event|
  Factory :event_menu, :item_type => 'StaticItem', :title => 'Programme', :url => '/tracks', :event_id => Event.find_by_title(event).id
end