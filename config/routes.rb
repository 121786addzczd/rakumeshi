Rails.application.routes.draw do
  root to: 'home#top'

  get "about" => "home#about"
end
