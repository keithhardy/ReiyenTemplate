Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resource :sessions, only: [:destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
