Eventstreams2::Application.routes.draw do
  
  resources :event_menus

  resources :talks

  devise_for :users

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
  
  root :to => "pages#home"

  resources :events, :only => [:index]
    
  resources :users do
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
    end
  end
  
end
