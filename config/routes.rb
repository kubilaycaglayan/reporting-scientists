Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create]
  resources :followings, only: [:new, :create, :destroy]
  resources :opinions
  get 'sessions/destroy'
  root to: 'sessions#new'
end
