Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'about', to: 'toppages#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :items, only: [:show, :new, :create, :destroy]
end