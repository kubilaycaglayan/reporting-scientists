Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :followings, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :new, :create]
  root to: 'sessions#new'
  get '*path' => redirect('/')
end
