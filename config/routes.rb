Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :book, only: [:new, :index, :show]
end
