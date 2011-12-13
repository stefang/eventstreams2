module ApplicationHelper
  
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
  
end
