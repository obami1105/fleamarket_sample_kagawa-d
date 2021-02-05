Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show]
  get 'api/items/category',to: 'items#get_category'
end
