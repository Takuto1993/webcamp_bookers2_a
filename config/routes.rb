Rails.application.routes.draw do
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  devise_for :users
  resources :books, only: [:new, :update, :create, :index, :edit, :show]
  resources :users, only: [:new, :update, :create, :index, :edit, :show]
end
