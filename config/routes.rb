Rails.application.routes.draw do
  get 'followings/new'
  get 'followings/create'
  get 'followings/destroy'
  resources :opinions
  resources :users
  resources :sessions, only: [:new, :create]
  get 'sessions/destroy'
  root to: 'sessions#new'
end
