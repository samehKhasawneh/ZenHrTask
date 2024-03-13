Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:create]
  post '/login', to: 'users#login'

  resources :job_posts, only: [:index, :create, :destroy, :show]
  resources :job_applications, only: [:index, :create, :update] # Admin will only view and update job applications
end
