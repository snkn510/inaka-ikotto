Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :users, only: [:show, :edit, :update]
  resources :events do
    resources :comments, only: :create
    resources :bookings, only: [:index, :create]
  end
end
