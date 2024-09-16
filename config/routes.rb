Rails.application.routes.draw do

  # Root route
  root 'main#index'

  # Posts Controller routes
  get 'home', to: 'posts#index'

  # Sessions Controller routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'logout', to: 'sessions#destroy'

  # Users Controller routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
