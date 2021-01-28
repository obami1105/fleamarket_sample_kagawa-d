Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :show]
  get 'purchase', to: 'items#purchase'
end
