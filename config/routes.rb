Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :categories, only: [:show, :index]

  get "up" => "rails/health#show", as: :rails_health_check
end
