Rails.application.routes.draw do
  
  
  get 'sessions/new'
  get 'topics/new'
  # get 'session/new'
  get 'users/new'
  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
