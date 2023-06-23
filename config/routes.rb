Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :users, only: [:show, :edit, :update]
  resources :events do
    resources :comments, only: :create
    resources :bookings, only: [:index, :create]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]

end
