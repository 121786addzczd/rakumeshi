Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: 'home#top'

  get "about" => "home#about"

  resources :posts

  resources :users, only: [:index, :show, :edit, :update]

end
