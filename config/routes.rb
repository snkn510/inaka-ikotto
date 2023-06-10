Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :comments, only: :create
    resources :bookings, only: [:index, :create]
  end
  resources :users, only: [:show, :edit]
end
