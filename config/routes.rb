Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :books, only: [:new, :update, :destroy, :create, :index, :edit, :show]
  resources :users, only: [:new, :update, :destroy, :create, :index, :edit, :show]
end
