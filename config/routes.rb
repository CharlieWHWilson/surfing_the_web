Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  #post '/upload', to: 'surfboards#upload'

  # Defines the root path route ("/")
  resources :surfboards, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :surfboards, only: [:destroy]
  resources :bookings, only: [:destroy]

  get "/dashboard", to: "pages#dashboard"
      # post 'approve', on: :member
      # post 'decline', on: :member

end
