Eventstreams2::Application.routes.draw do
  
  resources :sponsors

  resources :event_pages

  devise_for :users

  constraints(Subdomain) do
   root :to => 'events#show'
   resources :event_news_items, :path => 'news'
   resources :sponsors, :only => [:index]
   match "/:id" => "event_pages#show"
  end
  
  root :to => "pages#home"

  resources :events, :only => [:index]
    
  resources :users do
    resources :events do
      resources :event_news_items
      resources :event_pages
      resources :sponsors      
    end
  end
  
end
