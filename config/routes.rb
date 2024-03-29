Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:create]
  post '/login', to: 'users#login'

  resources :job_posts, only: %i[index create destroy show]

  resources :users do
    resources :job_applications, only: %i[index create show]
  end

  namespace :admin do
    resources :job_posts do
      resources :job_applications, only: %i[index show]
    end
  end
end
