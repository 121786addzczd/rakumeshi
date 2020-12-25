Rails.application.routes.draw do
  get 'posts/index'
  root to: 'home#top'

  get "about" => "home#about"

  resources :posts, only: [:index, :new, :create, :show]
end
