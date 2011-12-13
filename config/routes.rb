Eventstreams2::Application.routes.draw do
  
  devise_for :users

  constraints(Subdomain) do
   root :to => 'events#show'
  end
  root :to => "pages#home"

  resources :events, :only => [:index, :show]
    
  resources :users do
    resources :events
  end
  
end
