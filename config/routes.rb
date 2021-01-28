Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'purchase', to: 'items#purchase'
  # root :to => 'items#purchase', as: 'purchase'
  resources :items, only: [:new,:show]
  end
