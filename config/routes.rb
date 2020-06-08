Rails.application.routes.draw do
  resources :opinions
  resources :users
  resources :sessions, only: [:new, :create]
  get 'sessions/destroy'
  root to: 'sessions#new'
end
