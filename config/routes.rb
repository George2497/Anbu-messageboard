Rails.application.routes.draw do

  # Root route
  root 'main#index'

  # Posts Controller routes
  resources :posts
  get 'home', to: 'posts#index'

  get 'createpost', to: 'posts#new'
  post 'createpost', to: 'posts#create'

  # Sessions Controller routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  # Users Controller routes
  resources :users do
    member do
      get :profile
    end
  end
  get 'signup', to: 'users#new'
end
