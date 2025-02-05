Rails.application.routes.draw do
  get "error/index"
  root "welcome#index"
  resources :properties
  resources :appointments
  resources :transactions
  get "properties/index"
  get "properties/show"
  get "properties/new"
  get "properties/create"
  get "properties/edit"
  get "properties/update"
  get "properties/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Catch-all route (should be placed last)
  match '*path', to: 'application#not_found', via: :all

end
