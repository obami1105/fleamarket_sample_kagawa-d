Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show] do
    collection do
      get 'search'
    end
  end
  get 'api/items/category',to: 'items#get_category'

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
    get 'signout', to: 'users#signout'
  end

  get 'purchase', to: 'items#purchase'
  get 'mypage', to: 'users#show'
  resources :credit_cards, only: [:index, :new]
end
