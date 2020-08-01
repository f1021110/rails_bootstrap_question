Rails.application.routes.draw do
  get 'session/new'
  get 'users/new'
  root 'pages#index'
  get 'pages/help'

  resources :users

  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
