Rails.application.routes.draw do
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  devise_for :users
  resources :books, only: [:new, :create, :show]
  resources :users, only: [:index, :edit, :update,]
end
