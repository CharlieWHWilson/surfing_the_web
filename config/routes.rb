Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :surfboards, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show] do
    member do
      post :approve
      post :decline
    end
  end
  
  resources :surfboards, only: [:destroy]
      # post 'approve', on: :member
      # post 'decline', on: :member

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  # root "posts#index"
end
