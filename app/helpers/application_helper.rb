module ApplicationHelper
  
  def is_owner?(owned_object)
    current_user == owned_object.user
  end
  
  def admin_menu_enabled?
    @event && !!@enable_admin_side_menu
  end
  
  def on_subdomain?
    request.subdomain(SUBDOMAIN_LEVEL).present? && request.subdomain(SUBDOMAIN_LEVEL) != 'www'
  end
  
  def asset_display(text)
    return text.gsub(/\[asset:([0-9]+)\]/) {|s| find_asset_url($1)} unless text.blank?
  end
  
  def find_asset_url(asset_id)
    for asset in @event.owned_event_assets
      if asset.id == asset_id.to_i
        return image_tag(asset.asset.url)
      end 
    end
  end
  
end
