NRUG::Application.routes.draw do
  
  match '/auth/:provider/callback', :to => 'sessions#create'
  match "/login" => "sessions#new", :as => :login
  match "/logout" => "sessions#destroy", :as => :logout
  # match '/auth/failure', to: 'sessions#failure'
  
  resources :messages
  resources :users
  
  root :to => 'messages#new'
  # root :to => "base#index"
end