Given /^"([^"]*)" has a published speaker called "([^"]*)"$/ do |event, name|
  speaker = Factory :speaker, :name => name, :event_id => Event.find_by_title(event).id
end

Given /^"([^"]*)" has an upublished speaker called "([^"]*)"$/ do |event, name|
  speaker = Factory :speaker, :name => name, :event_id => Event.find_by_title(event).id, :published => false
end
