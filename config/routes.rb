Rails.application.routes.draw do
  devise_for :hospitals, controllers: {
    sessions: 'hospitals/sessions',
    registrations: 'hospitals/registrations',
  }

  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :patient do
    get "/patient/dashboard", to: "patients#dashboard", as: :patient_dashboard
    resources :bookings, only: [:show]
  end

  authenticated :hospital do
    get "/bookings/:id", to: "bookings#hospital_show", as: :authenticated_hospital_booking_show
    resources :booking_types

    root to: "hospitals#dashboard", as: :authenticated_hospital_root
  end

  resources :bookings, except: [:index, :new]

  post "payment-intent", to: "bookings#intent"
  get ":booking_link", to: "hospitals#show", as: :hospital

  scope '/:booking_link', as: :hospital do
    resources :bookings, only: [:index, :new]
  end

  resources :webhooks, only: :create

  # Defines the root path route ("/")
  root "home#index"
end
