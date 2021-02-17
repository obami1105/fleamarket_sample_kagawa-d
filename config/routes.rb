Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :items, only: [:new, :create, :show, :purchase] do
    collection do
      get 'search'
      get ':id/purchase', to: 'items#purchase', as: 'purchase'
      post 'buy/:id', to: 'items#buy', as: 'buy'
      get  'done', to: 'items#done', as: 'done'
    end
  end
  root 'items#index'
  get 'api/items/category',to: 'items#get_category'

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
    get 'signout', to: 'users#signout'
  end

  get 'purchase', to: 'items#purchase'
  get 'mypage', to: 'users#show'

  resources :credit_cards, only: [:new, :show,:destroy] do
    member do
      post 'buy', to: 'credit_cards#buy'
    end
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
    end
  end

end
