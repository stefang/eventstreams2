Eventstreams2::Application.routes.draw do
  
  devise_for :users

  constraints(Subdomain) do
   root :to => 'events#show'
   resources :event_news_items, :path => 'news'
  end
  
  root :to => "pages#home"

  resources :events, :only => [:index, :show]
    
  resources :users do
    resources :events do
      resources :event_news_items
    end
  end
  
end
