Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get "user", to: 'users#new_user'
  root 'users#new_user'
  # config/routes.rb

  # User Routes
  post 'register', to: 'users#create'
  post 'login', to: 'sessions#create'
  put 'users/:id/role', to: 'users#update_role'

  # Spaces Routes
  resources :spaces, only: [:index, :create, :update, :destroy] do
    # Objects and Spots inside Spaces
    resources :space_objects, only: [:index, :create]
    resources :spots, only: [:index, :create]
  end

  # Objects Routes
  post 'objects/delete', to: 'objects#bulk_delete'

  # Spots Routes
  post 'spots/delete', to: 'spots#bulk_delete'

  # Bookings Routes
  resources :bookings, only: [:index, :create, :destroy]

  # Spots_Booking Routes (if needed for specific spot booking management)
  resources :spots_booking, only: [:create]

end
