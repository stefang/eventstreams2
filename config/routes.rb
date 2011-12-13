Eventstreams2::Application.routes.draw do
  
  devise_for :users

  constraints(Subdomain) do
   root :to => 'events#show'
   resources :event_news_items, :path => 'news'
   resources :sponsors, :only => [:index]
   resources :venues, :path => 'location', :only => [:index]
   match "/:id" => "event_pages#show"
  end
  
  root :to => "pages#home"

  resources :events, :only => [:index]
    
  resources :users do
    resources :events do
      resources :event_news_items
      resources :event_pages
      resources :sponsors    
      resources :links
      resources :venues, :path => 'location'  
    end
  end
  
end
