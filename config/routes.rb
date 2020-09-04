Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :followings, only: [:new, :create, :destroy]
  resources :opinions, only: [:index, :new, :create]

  namespace :api, :defaults => {:format => :json}, :path => "", :constraints => {:subdomain => "api"} do
    resources :users
  end

  root to: 'sessions#new'
  get '*path' => redirect('/')
end
