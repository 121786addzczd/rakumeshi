Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: 'home#top'

  get "about" => "home#about"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member

    member do
      get :likes
    end
  end

end
