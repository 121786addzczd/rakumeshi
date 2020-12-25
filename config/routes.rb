Rails.application.routes.draw do
  get 'posts/index'
  root to: 'home#top'

  get "about" => "home#about"

  resources :posts
end
