Rails.application.routes.draw do
  resources :booking_types
  resources :bookings
  devise_for :doctors
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :patient do
    root to: redirect("/patients/edit"), as: :authenticated_patient_root
    get "/", to: "home#dashboard", as: "patient_dashboard"
  end

  # Defines the root path route ("/")
  root "home#index"
end
