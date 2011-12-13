module ApplicationHelper
  
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
  
  def admin_menu_enabled?
    @event && !!@enable_admin_side_menu
  end
  
  def on_subdomain?
    request.subdomain.present? && request.subdomain != 'www'
  end
  
end
