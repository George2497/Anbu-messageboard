Rails.application.routes.draw do
  root 'main#index'
  get 'home', to: 'posts#index'
  get 'login', to: 'sessions#index'
end
