Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
    get 'signout', to: 'users#signout'
  end

  resources :items, only: [:new, :show]
  get 'purchase', to: 'items#purchase'
  get 'mypage', to: 'users#show'
  resources :credit_cards, only: [:index, :new]
  root 'items#index'
end
