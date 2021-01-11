Rails.application.routes.draw do
  root to: 'home#top'
  get  'home/about'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'posts/index'

  resources :posts do
    collection do
      get 'search', 'posts_search', 'follows'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :likes, :follows, :followers
    end
  end

end
