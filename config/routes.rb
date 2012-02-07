Eventstreams2::Application.routes.draw do
  
  devise_for :users
  
  # subdomain routes

  constraints(Subdomain) do
   root :to => 'events#show'
   resources :event_news_items, :path => 'news'
   resources :sponsors, :only => [:index]
   resources :venues, :path => 'location', :only => [:index]
   resources :tracks, :path => 'programme', :only => [:index, :show]
   resources :speakers, :only => [:index, :show]
   resources :talks, :only => [:index, :show]
   match "/:id" => "event_pages#show"
  end
  
  # home page routes
  
  root :to => "pages#home"

  # admin routes
  
  namespace :admin do
    resources :events do
      resources :event_news_items
      resources :event_pages
      resources :tracks
      resources :speakers
      resources :sponsors
      resources :talks    
      resources :links
      resources :venues, :path => 'location'  
      resources :event_menus
      resources :event_assets
    end
  
    post 'events/:event_id/event_menus', :to => 'event_menus#create'
    post 'events/:event_id/event_menus/:id/update', :to => 'event_menus#update'
    post 'events/:event_id/event_menus/:id/destroy', :to => 'event_menus#destroy'
    post 'events/:event_id/event_menus/update_order', :to => 'event_menus#update_order'
  
    post 'events/:event_id/speakers/update_order', :to => 'speakers#update_order'
    post 'events/:event_id/tracks/update_order', :to => 'tracks#update_order'
    post 'events/:event_id/sponsors/update_order', :to => 'sponsors#update_order'
    post 'events/:event_id/venues/update_order', :to => 'venues#update_order'
  end
end
